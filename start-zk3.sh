# mkdir /tmp/zk3
# echo 3 > /tmp/zk3/myid
./kafka_2.13-3.4.0/bin/zookeeper-server-start.sh zk3.properties > zk3.log 2>&1 &

