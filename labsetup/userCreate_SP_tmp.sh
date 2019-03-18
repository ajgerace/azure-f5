#!/bin/bash

#Required Enviroment Variable
#AZURE_USERNAME=
#AZURE_PW
#AZ_USER_PW (This is the new user PW)

# How to run the script:
# scriptname "Number of Uses to Generate" "ComplexPassword" "Username Prexix"


#Define Azure VARs
AZ_USER_PREFIX=$3
AZ_USER_DOMAIN="empty"
AZ_USER_PW=$2
AZ_ROLE=contributor
AZ_USER_NUM=$1

echo "Log in to AZ:"

read -p "Enter AZ Admin Username: " ADMIN_USER
read -p "Enter AZ Domain: " AZ_USER_DOMAIN
read -p "Password: " ADMIN_PW

AZ_USER_DOMAIN=${AZ_USER_DOMAIN}.onmicrosoft.com

AZURE_SUBSCRIPTION_ID=$(az login -u $ADMIN_USER@$AZ_USER_DOMAIN -p $ADMIN_PW -o json | jq '.[0].id' -r)
AZURE_TENANT_ID=$(az account show --query tenantId -o tsv)
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


  echo "Creating AZ User with display name: $DISPLAY_NAME, SP: $USER_PRINCIPAL, password: $AZ_USER_PW "
  USER_CREDS=$(az ad user create --display-name $DISPLAY_NAME --user-principal-name $USER_PRINCIPAL --password $AZ_USER_PW --force-change-password-next-login false --output json )
  ROLE1=$(az role assignment create --assignee $USER_PRINCIPAL --role contributor)
  ROLE2=$(az role assignment create --assignee $USER_PRINCIPAL --role "user access administrator")

  AZURE_SECRET=$(uuidgen)
  AZURE_CLIENT_ID=$(az ad sp create-for-rbac --name $DISPLAY_NAME --password $AZURE_SECRET -o json | jq '.appId' -r)

  echo "" > vault_$DISPLAY_NAME.yml
  echo "azure_client_id:" $AZURE_CLIENT_ID  >> vault_$DISPLAY_NAME.yml
  echo "azure_subscription_id:" $AZURE_SUBSCRIPTION_ID >> vault_$DISPLAY_NAME.yml
  echo "azure_secret:" $AZURE_SECRET        >> vault_$DISPLAY_NAME.yml
  echo "azure_tenant_id:" $AZURE_TENANT_ID  >> vault_$DISPLAY_NAME.yml
  echo "azure_user:" $DISPLAY_NAME >> vault_$DISPLAY_NAME.yml
  echo "azure_user_pass:" $AZ_USER_PW >> vault_$DISPLAY_NAME.yml
done
