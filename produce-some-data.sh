./kafka_2.13-3.4.0/bin/kafka-producer-perf-test.sh \
	--topic test \
	--producer-props bootstrap.servers=localhost:9091 \
	--throughput 10 \
	--num-records 10000 \
	--record-size 1000
