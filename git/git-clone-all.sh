#!/bin/bash

echo "NOTE: you must be logged into the github cli for this to work!"
sleep 5
clear
echo "Please enter a github organization/user name"
read -pr "--> " owner
gh repo list $owner --limit 1000 | awk '{print $1; }' | xargs -L1 gh repo clone || echo "User/organization doesn't exist!"

