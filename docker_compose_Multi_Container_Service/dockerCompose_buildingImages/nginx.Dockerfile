FROM nginx:1.13

# Copy in the proxy configurations to listen to port 80 and from the host
# File in current directory (host machine)     contianer folder path to put that file 
COPY nginx.conf /etc/nginx/conf.d/default.conf

