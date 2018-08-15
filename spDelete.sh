#!/bin/bash
# script to remove Service Principal that was created via the spCreate Script

# Create SP_Name variable
export SP_NAME="$(echo $AZURE_USERNAME | awk -F'@' '{print $1}')-App"

export SP_Id=$(az ad sp list --display-name $SP_NAME |jq '.[0] .appId' --raw-output )

# remove SPN 
cmd=$(az ad sp delete --id $SP_Id)
