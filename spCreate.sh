#!/bin/bash

#Student Script#

#This Script Creates an Azure Service Principal for Rbac based on the provided Azure Uswername.
#If student does not have a USERNAME and Password they should ask the instructor for one.

#Required Enviroment Variable
#AZURE_USERNAME=
#AZURE_PW=

#Set Username to be created
export AZURE_STUDENT="$(echo $AZURE_USERNAME | awk -F'@' '{print $1}')"
export SP_NAME="$(echo $AZURE_USERNAME | awk -F'@' '{print $1}')-App"
SP_PASSWORD=$(uuidgen)
az_name="azure_user: ${AZURE_STUDENT}"
az_pass="azure_user_pass: $AZURE_PW"

#Log into Azure and Output the SUbcription ID
AZURE_SUBSCRIPTION_ID=$(az login -u $AZURE_USERNAME -p $AZURE_PW | jq '.[0] .id' --raw-output)
subscription_id="azure_subscription_id: ${AZURE_SUBSCRIPTION_ID}"
AZURE_SUBSCRIPTION_ID="export AZURE_SUBSCRIPTION_ID=${AZURE_SUBSCRIPTION_ID}"

#GET Tenant  ID
AZURE_TENANT=$(az account list | jq '.[0] .tenantId' --raw-output)
AZURE_TENANT="export AZURE_TENANT=${AZURE_TENANT}"
tenant="azure_tenant_id: $(az account list | jq '.[0] .tenantId' --raw-output)"

#Create new SP
AZURE_CLIENT_ID=$(az ad sp create-for-rbac --name $SP_NAME --password $SP_PASSWORD | jq '.appId' --raw-output)
[ -z "$AZURE_CLIENT_ID" ] && error=1
client_id="azure_client_id: ${AZURE_CLIENT_ID}"
AZURE_CLIENT_ID="export AZURE_CLIENT_ID=${AZURE_CLIENT_ID}"

AZURE_SECRET="export AZURE_SECRET=$SP_PASSWORD"
secret="azure_secret: $SP_PASSWORD"

if [ ! -z "$error" ]
then
  echo "An Error Occurred - Please raise your hand "
else
echo "Cut and Paste the SP ENV Variables "
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
fi

#Response sent to client
