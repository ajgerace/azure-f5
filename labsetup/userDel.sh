#!/bin/bash
#Required Enviroment Variable
#AZURE_USERNAME=
#AZURE_PW=

#Log into Azure and Output the SUbcription ID
#LOGIN=$(az login -u $AZURE_USERNAME -p $AZURE_PW)

#Usage
#.userDel.sh "username_prefix"



if [ -z "$1" ]
  then
    echo "No argument supplied"
    echo "usage $0 "prefix_of_username_to_delete""
    exit 1
fi

PREFIX_TO_DELETE=$1

echo "looking for users..."
AZURE_USERS=$(az ad user list --output json| jq .[].userPrincipalName -r)

#echo "found users: $AZURE_USERS "
CONTINUE_count=0
for USER in $AZURE_USERS;
  do
    if [[ $USER == $PREFIX_TO_DELETE* ]]; then
      echo "$USER will be deleted"
      ((CONTINUE_count++))
    fi
done

echo "Total users to delete $CONTINUE_count"

case $CONTINUE_count in
    0)
    echo "Didnt find users to delete :( , Goodbye.."
    exit 1 ;;

    *)
    read -p "Are you sure? (y/n) "  -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy]$ ]];then

      for USER in $AZURE_USERS;
        do
          if [[ $USER == $PREFIX_TO_DELETE* ]]; then
            echo "Deleting $USER "
            az ad user delete  --upn-or-object-id $USER
          fi
        done
      fi;;
  esac
