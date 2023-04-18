#!/bin/bash

set -e -u

echo Cleaning up previous runs
rm -rf /tmp/c{1,2,3}
rm -f c{1,2,3}.log

echo Generating cluster id
CLUSTER_ID=$(kafka-storage random-uuid)
echo "Generated cluster id: $CLUSTER_ID"

for i in 1 2 3; do
  echo Starting Server $i
  kafka-storage format -t $CLUSTER_ID -c c$i.properties
  kafka-server-start c$i.properties > c$i.log 2>&1 &
done
