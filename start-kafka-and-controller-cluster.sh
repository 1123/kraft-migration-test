#!/bin/bash

set -e -u

echo Cleaning up previous runs
rm -rf /tmp/c{1,2,3}
rm -f c{1,2,3}.log

rm -rf /tmp/k{1,2,3}
rm -f k{1,2,3}.log

echo Generating cluster id
CLUSTER_ID=$(kafka-storage random-uuid)
echo "Generated cluster id: $CLUSTER_ID"

for i in 1 2 3; do
  echo Starting Kafka Broker $i
  ./kafka_2.13-3.4.0/bin/kafka-storage.sh format -t $CLUSTER_ID -c k$i.properties
  ./kafka_2.13-3.4.0/bin/kafka-server-start.sh k$i.properties > k$i.log 2>&1 &
  echo Starting Kafka Controller $i
  ./kafka_2.13-3.4.0/bin/kafka-storage.sh format -t $CLUSTER_ID -c c$i.properties
  ./kafka_2.13-3.4.0/bin/kafka-server-start.sh c$i.properties > c$i.log 2>&1 &
done
