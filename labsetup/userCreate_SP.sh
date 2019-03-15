#!/bin/bash

#Required Enviroment Variable
#AZURE_USERNAME=
#AZURE_PW
#AZ_USER_PW (This is the new user PW)

# How to run the script:
# scriptname "Number of Uses to Generate" "ComplexPassword" "Username Prexix" "Starting User"
# 3 and 4 not implemented

#Define Azure VARs
AZ_USER_PREFIX=$3
AZ_USER_DOMAIN="empty"
AZ_USER_PW=$2
AZ_ROLE=contributor
AZ_USER_NUM=$1
# STARTING_USER=$3

echo "Log in to AZ:"

read -p "Enter AZ Admin Username: " ADMIN_USER
read -p "Enfer AZ Domain: " AZ_USER_DOMAIN
read -p "Password: " ADMIN_PW

LOGIN=$(az login -u $ADMIN_USER@$AZ_USER_DOMAIN -p $ADMIN_PW -o json)
#echo $LOGIN

echo "Creating Users:"
echo "==============="

for  (( c=1; c<=$AZ_USER_NUM; c++ ))
do
   USER=$c
   echo "------"
   echo "Generating user # "$USER
   DISPLAY_NAME="${AZ_USER_PREFIX}${USER}"
   echo "user name: "$DISPLAY_NAME
   USER_PRINCIPAL="$DISPLAY_NAME@$AZ_USER_DOMAIN"
   echo "user principal: "$USER_PRINCIPAL
  #LOGIN=$(az login -u $AZURE_USERNAME -p $AZURE_PW)
  #echo "Skipping"
  echo "Creating AZ User with display name: $DISPLAY_NAME, SP: $USER_PRINCIPAL, password: $AZ_USER_PW "
  USER_CREDS=$(az ad user create --display-name $DISPLAY_NAME --user-principal-name $USER_PRINCIPAL --password $AZ_USER_PW --force-change-password-next-login false --output json | jq .userPrincipalName -r)
  echo "Assign Contributor Role: " $USER_PRINCIPAL
  ROLE1=$(az role assignment create --assignee $USER_PRINCIPAL --role contributor)
  echo "Assign User Access Admin: " $USER_PRINCIPAL
  ROLE2=$(az role assignment create --assignee $USER_PRINCIPAL --role "user access administrator")
  echo "User $USER_CREDS was created"
  AZURE_CLIENT_ID=$(az ad sp create-for-rbac --name $DISPLAY_NAME --password $AZ_USER_PW -o json | jq '.appId' --raw-output)
  echo "Application ID $AZURE_CLIENT_ID was generated for Service Principal $DISPLAY_NAME"
done
