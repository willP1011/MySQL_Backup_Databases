#!/bin/bash

#This script is made with the proposal to make backups of databases made by MySQL

# Configuration of MySQL Database

DB_HOST="your_host"
DB_USER="your_mysql_user"
DB_PASS="your_password
DB_NAME="your_database_name"

# This variable is the path you are saving the backup.
PATH_BACKUP="/your/final/path"

#This variable is made to export the actual date and safe the result into the variable.

DATE=$(date +"%d-%m-%Y-%H:%M:%S")

#With all the variables we've made before, here we will create with the variable the final path and the name that we want for our backup.

FILE_BACKUP="$PATH_BACKUP/$DB_NAME-$DATE.sql"

#We will make the backup with mysqldump with the final name FILE_BACKUP

MYSQL_CMD="mysqldump --host=$DB_HOST --user=$DB_USER --password=$DB_PASS $DB_NAME > $FILE_BACKUP"

#We are going to make the path if we didn't create it before.

mkdir -p $PATH_BACKUP

#We execute the mysqldump variable with eval.
eval $MYSQL_CMD

#We are going to create a condition that will tell us if the backup went correctly without errors, and if we have an error, we will get a message. 

if [ $? = 0 ]; then

        echo "The backup of the database went correctly without errors and its saved with the name_: $FILE_BACKUP"

else
        echo "There is an error making the backup."

fi
