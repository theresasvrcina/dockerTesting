# Run the commands in a terminal to interact with Kafka-Cluster
#
# 
# @author: Stephane Maarek
# @edited_by Anna Bear 
# Reference: These practices are from Stephane Maarek's O'Reily Apache Kafka Series - Kafka Connect Hands-on Learning course.

# Check your containers or list then
docker ps 

# list 
docker container ls -a 

# Run to create a container and to interact with it with a bash terminal
# replace landoop/fast-data-dev with your container name 

docker run --rm -it --net=host landoop/fast-data-dev bash

# Next create a kafka topic
# Replace "demo-3-twitter" with the kafka topic you created in your twitter connector (JSON config file)
# Replace 127.0.0.1 with whichever is hosting the kafka cluster
kafka-topics --create --topic demo-3-twitter --partitions 3 --replication-factor 1 --zookeeper 127.0.0.1:2181


# Act as a consumer of the data
# This will bring to your screen twitter feeds with the terms you indicated to track in the JSON config file
# Replace "demo-3-twitter" with the kafka topic you created in your twitter connector (JSON config file)
# Replace 127.0.0.1 with whichever is hosting the kafka cluster
kafka-console-consumer --topic demo-3-twitter --bootstrap-server 127.0.0.1:9092
