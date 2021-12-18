#!/bin/bash

# 1. google "install gcloud"
# 2. click "installing with apt-get (Debian ..."
# 3. Do 1, 2, 3, skip 4 do 5 (as below)

# https://cloud.google.com/sdk/docs/downloads-apt-get

if ! gcloud version
then
    echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] https://packages.cloud.google.com/apt cloud-sdk main"
    sudo apt-get install apt-transport-https ca-certificates gnupg
    curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -
    sudo apt-get update && sudo apt-get install google-cloud-sdk
fi

if ! gcloud compute instances list 
then
   gcloud init
   gcloud compute instances list
fi

if ! gcloud compute instances list |grep example-instance-1
then
   gcloud compute instances list create example-instance-1 --zone=us-central1-a
fi


