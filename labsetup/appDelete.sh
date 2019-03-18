#!/bin/bash

#This Script deletes all Apps that start with student from the subscription.



#Required Enviroment Variable
#AZURE_USERNAME=
#AZURE_PW=
USER_PREFIX="empty"

#Log into Azure and Output the SUbcription ID
echo "Log in to AZ:"

read -p "Enter AZ Admin Username: " ADMIN_USER
read -p "Enter AZ Domain: " AZ_USER_DOMAIN
read -p "Password: " ADMIN_PW
read -p "Prefix of App to delete: " USER_PREFIX

AZ_USER_DOMAIN=${AZ_USER_DOMAIN}.onmicrosoft.com
LOGIN=$(az login -u $ADMIN_USER@$AZ_USER_DOMAIN -p $ADMIN_PW -o json)

AZURE_APPS=$(az ad app list -o json | jq ".[].homepage " -r)

for APP in $AZURE_APPS
do
  if [[ $APP == *$USER_PREFIX* ]]; then
  echo "Deleting: $APP"
  	az ad app delete  --id $APP
  fi
#az ad user delete --upn-or-object-id $ID
done
