mkdir /tmp/zk1
echo 1 > /tmp/zk1/myid
./kafka_2.13-3.4.0/bin/zookeeper-server-start.sh zk1.properties > zk1.log 2>&1 &

