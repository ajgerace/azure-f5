#!/bin/bash

#This Script deletes all Apps that start with student from the subscription.#

###AZURE_USERNAME=
###AZURE_PW=

# Discover appId
AppId=$(env | grep $AZURE_USERNAME | cut -d"@" -f1| cut -d"=" -f2)
AppId=$(az ad app list --output json | jq ".[].homepage" -r | grep $AppId)
echo "Discovered Application to delete: " $AppId
for App_Name in $AppId;
  do
  echo "Deleting: $App_Name"
  error=$(az ad app delete --id $App_Name)
  if [[ ! -z $error ]]; then
    echo "An error occured: $error"
  fi
done
