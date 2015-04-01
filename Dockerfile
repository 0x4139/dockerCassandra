FROM 0x4139/java7

MAINTAINER Vali Malinoiu <0x4139@gmail.com>

#copy cassandra over
COPY apache-cassandra-2.0.13-bin.tar.gz /tmp/

RUN mkdir /opt/cassandra
RUN tar -xzf /tmp/apache-cassandra-2.0.13-bin.tar.gz  --strip-components=1 -C "/opt/cassandra"
RUN rm -rf /tmp/*

#copy run script and give it the apropiate rights
COPY run.sh /usr/
RUN chmod +x /usr/run.sh

# Expose ports
EXPOSE 7199 7000 7001 9160 9042

# start cassandra

CMD /usr/run.sh
