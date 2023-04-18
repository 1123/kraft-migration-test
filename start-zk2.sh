# mkdir /tmp/zk2
# echo 2 > /tmp/zk2/myid
./kafka_2.13-3.4.0/bin/zookeeper-server-start.sh zk2.properties > zk2.log 2>&1 &

