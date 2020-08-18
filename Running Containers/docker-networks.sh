#
#  This bash script, creates a custom Docker Network and then checks
#  to see what the IP's are of the containers created within the 
#   virtual network I created. 
#  Later in this program, it will create a CentOS instance and use the curl
#   command to each container hosting the ElasticSearch service (version 2). 
#  
#  @author Anna Bear
#



printf "\n"
printf "After creating a virtual network, the output will return a hash for verification."
printf "\n"

# create my virtual network
docker network create my-network 

#create my containers running on my custom virtual network

printf "\n"
printf "I created two containers, each container creation will return a hash."
printf "\n"
docker container run -d --net my-network --net-alias elastic elasticsearch:2
docker container run -d --net my-network --net-alias elastic2 elasticsearch:2

printf "\n"
printf "Run an nslookup command on each container, in an Apline Linux instance (Version 3.10).\n"
printf "An error might output, but it will still output an IP of each container.\n"
sleep 7

printf "\n"
docker container run --rm --net my-network alpine:3.10 nslookup elastic
docker container run --rm --net my-network alpine:3.10 nslookup elastic2
printf "\n"
sleep 10
printf "On a CentOS instnace run a curl command to a container made that is hosting ElasticSearch.\n"
printf "First container response\n"
printf "\n"
docker container run --rm --net my-network centos curl -s elastic:9200

sleep 7
printf "\n"
printf "Second container response\n"
printf "\n"
docker container run --rm --net my-network centos curl -s elastic2:9200



# clean and remove all instances, images, and networks to retain your memory space 
