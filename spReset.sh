#!/bin/bash

#Student Script#

#This Script Creates an Azure Service Principal for Rbac based on the provided Azure Uswername.
#If student does not have a USERNAME and Password they should ask the instructor for one.

#Required Enviroment Variable
#AZURE_USERNAME=
#AZURE_PW=
read -p  "Enter your student name: " USERNAME
read -p  "Enter the domain name:" DOMAIN
read -p  "Enter your student password: " AZURE_PW
#Set Username to be created
AZURE_USERNAME=${USERNAME}@${DOMAIN}.onmicrosoft.com

export AZURE_STUDENT="$(echo $AZURE_USERNAME | awk -F'@' '{print $1}')"
APPSUFFIX="$(uuidgen|head -c 5)"
export SP_NAME="$(echo $AZURE_USERNAME | awk -F'@' '{print $1}')-$APPSUFFIX"
SP_PASSWORD=$(uuidgen)
az_name="azure_user: ${AZURE_STUDENT}"
az_pass="azure_user_pass: $AZURE_PW"

#Log into Azure and Output the SUbcription ID
AZURE_SUBSCRIPTION_ID=$(az login -u $AZURE_USERNAME -p $AZURE_PW -o json | jq '.[0] .id' --raw-output)
subscription_id="azure_subscription_id: ${AZURE_SUBSCRIPTION_ID}"
AZURE_SUBSCRIPTION_ID="export AZURE_SUBSCRIPTION_ID=${AZURE_SUBSCRIPTION_ID}"

#GET Tenant  ID
AZURE_TENANT=$(az account list -o json | jq '.[0] .tenantId' --raw-output)
AZURE_TENANT="export AZURE_TENANT=${AZURE_TENANT}"
tenant="azure_tenant_id: $(az account list -o json | jq '.[0] .tenantId' --raw-output)"

sleep 2
#Create new SP
AZURE_CLIENT_ID=$(az ad sp create-for-rbac --name $SP_NAME -o json | jq '.appId' --raw-output)
#AZURE_CLIENT_ID=$(az ad sp create-for-rbac --name $SP_NAME --password $SP_PASSWORD -o json | jq '.appId' --raw-output)
[ -z "$AZURE_CLIENT_ID" ] && error=1
client_id="azure_client_id: ${AZURE_CLIENT_ID}"
AZURE_CLIENT_ID="export AZURE_CLIENT_ID=${AZURE_CLIENT_ID}"

AZURE_SECRET="export AZURE_SECRET=$SP_PASSWORD"
secret="azure_secret: $SP_PASSWORD"

if [ ! -z "$error" ]
then
  echo "An Error Occurred - Please raise your hand "
else
echo "Writing SP ENV Variables to vault file "
echo "=================================="
  #echo $AZURE_SUBSCRIPTION_ID
  #echo $AZURE_TENANT
  #echo $AZURE_CLIENT_ID
  #echo $AZURE_SECRET
echo $client_id
echo $secret
echo $subscription_id
echo $tenant
echo
echo $az_name
echo $az_pass

echo $client_id >> group_vars/all/vault.yml
echo $secret >> group_vars/all/vault.yml
echo $subscription_id >> group_vars/all/vault.yml
echo $tenant >> group_vars/all/vault.yml
echo
echo $az_name >> group_vars/all/vault.yml
echo $az_pass >> group_vars/all/vault.yml

echo "AzureLabDay" > .vault-pass.txt
fi

#Response sent to client
