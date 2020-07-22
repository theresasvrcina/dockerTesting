#  The Shell script explains the commands necessary to run the Kafka connections. 
#  @author Stephane Maarek
#  @edited_by Anna Bear
#
#  Reference: These practices are from Stephane Maarek's O'Reily Apache Kafka Series - Kafka Connect Hands-on Learning course. 


#  The docker-compose file pulls an image that serves as a visual to see our connectors.
#  Step 1 is to orchestrate up the Kafka Cluster services. 
#  Run the below command

docker-compose up <name-of-you-kafka-cluster>

# Next is to mount files needed to create the connection and data source file. 
# Also, create a container, get in interaction mode with the container with a bash terminal inside.
# To do all of this run the below command. 

docker run --rm -it -v "$(pwd)":/tutorial --net=host landoop/fast-data-dev bash


# Once inside the container, we can now create kafka topics and create the connection.
# The IP address can be changed to the public IP address from the cloud provider. 
# This is for testing purposes and practices from the O'Reily Apache Kafka Series. 
# Run the below command to create a kafka topic.
# Go to localhost:3030 to see the interface from the Dockerfile image and your topic created
# to verify. Also replace "demo-standalone3" with whatever you called your topic. 

kafka-topics --create --topic demo-1-standalone3 --partitions 3 --replication-factor 1 --zookeeper 127.0.0.1:2181

# In the container change directories through what you mounted earlier with the second command we did.
# Change directory to where you store your JSON property files.
# In that directory we will run the connection command below.
# The syntax for the parameters is the converter properties file goes first then all other file stream connections. 

connect-standalone worker.properties file-stream-stand-alone-demo.properties