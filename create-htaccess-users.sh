#!/bin/bash

#--------------------------------------------------------------------#
# Create all users of htaccess credentials from csv provided / username and password provided 
# File name    : create-htaccess-users.sh
# File version : 1.0
# Created by   : Mr. Mrunal M. Nachankar
# Created on   : 30-08-2017 09:22:AM
# Modified by  : None
# Modified on  : Not yet
# Description  : This file is used for creating the users either from csv file provided as an argument or credentials (username and password) supplied as argument. 
#--------------------------------------------------------------------#

set -e

CREATE_USER_LOG_FILE="/root/create-user.log";
#CREATE_USER_ERROR_LOG_FILE="create-user-error.log";


echo $#;
no_of_arguments=$#;
echo "Number of arguments: ${no_of_arguments} ($#)";

if [ ${no_of_arguments} == 1 ]; then

    echo "Valid number of arguments. (${no_of_arguments})";
    FILE_NAMES="$1";
    if [ -f ${FILE_NAMES} ]; then
        echo "File ${FILE_NAMES}. File exist."
    elif [ ! -f ${FILE_NAMES} ]; then
        echo "File ${FILE_NAMES}. File doesn't exist."
    else
        echo "File ${FILE_NAMES}. Oops something went wrong, please contact administrator."
    fi
    #FILE_NAMES=( "/root/create-users.csv" );                 # For testing purpose
    echo "File names are: ${FILE_NAMES[@]} and Timestamp: $DateTime_STAMP2";
    #echo "array : Len of array ${#FILE_NAMES[@]} : Len of first ${#FILE_NAMES} : Array ${FILE_NAMES[@]}"; # : Testing purpose printing

    echo "File names selected for user creation: ${FILE_NAMES[@]}";
    #echo "No of files: ${#FILE_NAMES[@]}"

    while IFS=, read -r ht_uname ht_passwd
    do
        echo "I got:${ht_uname}|${ht_passwd}";
        htpasswd -b /etc/apache2/.htpasswd ${ht_uname} ${ht_passwd}
    done < ${FILE_NAMES}
    exit

elif [ ${no_of_arguments} == 2 ]; then

    echo "Valid number of arguments. (${no_of_arguments})";
    ht_uname=$1;
    ht_passwd=$2; 
    echo "I got:${ht_uname}|${ht_passwd}";
    
    htpasswd -b /etc/apache2/.htpasswd ${ht_uname} ${ht_passwd}
    exit

else

    echo "Invalid no of arguments. (${no_of_arguments})";
    echo "Hence exiting. Please try again later.";
    exit

fi


#create_users_function |   tee  ${CREATE_USER_LOG_FILE};
exit