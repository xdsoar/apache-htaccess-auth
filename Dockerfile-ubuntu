# docker run --rm -d -t -i -p 80:80 -p 443:443  -v /storage/Docker/html:/var/www/html --restart=always  --name=apache-htaccess-auth  mrunal4/apache-htaccess-auth:latest 
# set the base image to phusion/baseimage(Ubuntu based)
FROM phusion/baseimage:latest 

# file Author / Maintainer to Mrunal 
MAINTAINER mrunal4888@gmail.com

# update repo, update all system packages and install (apache2 and apache2-utils)  
RUN apt update \
    && apt upgrade -y \
    && apt install -y apache2 apache2-utils 

# Copy conf files
COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf 
COPY .htpasswd /etc/apache2/.htpasswd 
COPY create-htaccess-users.sh /root/
COPY create-users.csv /root/

# To apply changes start and reload apache
RUN service apache2 restart \
    && service apache2 reload

# set working dir as /var/www/html
WORKDIR /var/www/html

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# expose http(80) and https(443)
EXPOSE 80 443

# start apache2 service
CMD apachectl -D FOREGROUND 