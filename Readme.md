Cassandra 2.0.13 as a docker container using java8
## Quickstart
```
docker run --name="0x4139-cassandra" -d -p 7199:7199 -p 7000:7000 -p 7001:7001 -p 9160:9160 -p 9042:9042  -e PUBLIC=127.0.0.1 -v /opt/casssandra/data:/var/lib/cassandra/data 0x4139/cassandra

```

## Contributing
practically if you want more parameters that you want to be configurable just send a pull request
