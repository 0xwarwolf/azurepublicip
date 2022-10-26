#!/bin/bash

for account in $(az account list --output json | jq -r '.[] | .id')
do
  echo "Subscription: $account"
  az account set --subscription ${account}
  az network public-ip list --output json | jq -rc '.[] | select(.ipAddress != null) | {name, ipAddress, resourceGroup}'
done