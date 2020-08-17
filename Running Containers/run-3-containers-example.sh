
printf "\n"
printf "Every time a container is made, a separate hash is outputted\n"
printf "\n"

# create 3 contianers 
printf "First container\n"
printf "\n"
docker container run -d -p 3306:3306 --name My-database -e MYSQL_RANDOM_ROOT_PASSWORD=yes mysql
printf "\n"
printf "Second container\n"
printf "\n"
docker container run -d --name My-webserver -p 8080:80 httpd
printf "\n"
printf "Third container\n"
printf "\n"
docker container run -d --name My-proxy -p 80:80 nginx


printf "\n"
printf "Show the status of the containers\n"
printf "\n"

# the command below will show the containers running on your local host/machine
docker container ls

sleep 10



printf "\n"
printf "Once you stop your containers the name is outputted to indicate which one was stopped. \n"


# this command can take many container names as parameters at once 
docker container stop My-database My-webserver My-proxy

printf "\n"
printf "When you remove containers, the name is outputted to indicate which one was removed as well. \n"
# containers must be stopped before running the remove command below
docker container rm My-database My-webserver My-proxy
printf "\n"
printf "After stopping and removing containers, you should see no containers listed\n"
docker container ls 

printf "\n"