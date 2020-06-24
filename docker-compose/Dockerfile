FROM drupal:8.8.8

# Install Git into the container to later clone a repository 
# The second part of the RUN command is to remove (delete) the apt cache to reduce the image size
RUN apt-get update && apt-get install -y git \
    && rm -rf /var/lib/apt/lists/*


# Similar in the compose, must match, the value in the key expressed in the YAML attributes 
# containing the file paths of the volumes indicated in the docker-compose YAML file. 
WORKDIR /var/www/html/themes

# Clone the drupal project 
RUN git clone --branch 8.x-3.x --single-branch --depth 1 https://git.drupal.org/project/bootstrap.git \
    && chown -R www-data:www-data bootstrap

# Change to the html working directory so the website service can launch on $ docker-compose up 
WORKDIR /var/www/html

