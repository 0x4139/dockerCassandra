#!/bin/bash

# Grab the container IP
ADDR=$(hostname --ip-address)
PUBLIC=${PUBLIC:=$ADDR}
# Check if a seed was provided
SEED=${SEED:=$ADDR}

echo "IP Address is: $ADDR"
echo "Public IP Address is: $PUBLIC"
echo "Seed is: $SEED"


if [ ! -f /root/.cassconfig ]; then
    echo "Configuring cassandra.yaml"
    # Target files
    ENV_FILE=/opt/cassandra/conf/cassandra-env.sh
    CONF_FILE=/opt/cassandra/conf/cassandra.yaml
    # Add heap settings
    echo MAX_HEAP_SIZE="4G" >> $ENV_FILE
    echo HEAP_NEWSIZE="800M" >> $ENV_FILE
    # cassandra.yaml configuration
    sed -i -e "s/cluster_name.*/cluster_name: '0x4139'/"  $CONF_FILE
    sed -i -e "s/listen_address.*/listen_address: $ADDR/"  $CONF_FILE
    sed -i -e "s/broadcast_rpc_address.*/broadcast_rpc_address: $PUBLIC/"  $CONF_FILE
    sed -i -e "s/- seeds.*/- seeds: \"$SEED\"/"  $CONF_FILE
    sed -i -e "s/rpc_address.*/rpc_address: $ADDR/"  $CONF_FILE

    touch /root/.cassconfig
fi

# Start server
cd /opt/cassandra
bin/cassandra -f
