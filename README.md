# apache-htaccess-auth
Apache authentication via htaccess

Created and Maintained by : Mrunal Nachankar "<mrunal4888@gmail.com>"

---

## To use the image:


### Express way

 1. Start new docker container. We have 2 ways to do it:
    * Start container with docker run
        
            docker run --rm -d -t -i -p 80:80 -p 443:443  -v /storage/Docker/html:/var/www/html --restart=always  --name=apache-htaccess-auth  mrunal4/apache-htaccess-auth:latest 

    * Start container with docker-compose
        
            docker-compose up -d

 2. Check on web browser 
    * If port is not changed. 

            http://localhost 
            
    * If port is changed then check on 

            http://localhost:<port>     
 

<br>

<br>

### Conventional way:

 1. First pull the docker image 

        docker pull mrunal4/apache-htaccess-auth:latest
    > It will pull image layer wise. Once completed bash prompt will be released to enter new command.

 2. Check the image is listed in the images list

        docker images
    > Check for **mrunal4/apache-htaccess-auth:latest** under **REPOSITORY** column values

 3. Now time has come to start new docker container with the pulled image. We have 2 ways to do it:
    * Start container with docker run
        
            docker run --rm -d -t -i -p 80:80 -p 443:443  -v /storage/Docker/html:/var/www/html --restart=always  --name=apache-htaccess-auth  mrunal4/apache-htaccess-auth:latest 

    * Start container with docker-compose
        
            docker-compose up -d
 4. Check on web browser 
    * If port is not changed. 

            http://localhost 

    * If port is changed then check on 

            http://localhost:<port>     

### alter user credentials

 1. Create users individually
    * Syntax
        
            docker exec -it <container_name/container_id> /bin/bash /root/create-htaccess-users.sh <username> <password>

    * Example : Lets assume our container name is "htapache" and we need to create username as "india" and password as "hindustan". 
        
            docker exec -it htapache /bin/bash /root/create-htaccess-users.sh india hindustan

 2. Alter (create new, delete existing and also change password) users in bulk 

    * Update details in "create-users.csv". File is comma seperated file. Means username and password seperated by comma(,). Please go through the examples given in the file. 

    * Use following command to apply changes according to the csv changes.
        * Syntax
                
                docker exec -it <container_name/container_id> /bin/bash /root/create-htaccess-users.sh create-users.csv

        * Example : Lets assume our container name is "htapache"
                
                docker exec -it htapache /bin/bash /root/create-htaccess-users.sh create-users.csv
        
 3. Delete users

    * Delete the line with the credentials(<useraneme>:<password_hash>) to delete from the file ".htaccess"

    * Example :

        * If we want to remove "no" user we need to delete following entry from the ".htaccess" file
                
                no:$apr1$e5qODHaS$ervN1QsENEf7p1tMDZ/.H1

 3. Change password of individually

        * Syntax
                
                docker exec -it <container_name/container_id> /bin/bash /root/create-htaccess-users.sh <username> <password>

        * Example : Lets assume our container name is "htapache" and we need to change password of username "india" and set new password as "Aisa@369". 
                
                docker exec -it htapache /bin/bash /root/create-htaccess-users.sh india Aisa@369

---

Thank you for using it. In case of any queries or suggestion feel fre to write back on mrunal4888@gmail.com.

---
