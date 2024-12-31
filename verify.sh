#!/bin/sh

apt update
apt install jq curl -y

ACCESS_TOKEN=`curl -H "Metadata-Flavor: Google"  http://metadata/computeMetadata/v1/instance/service-accounts/default/identity?audience=https://cloud-run-poc-service-dev-644036867588.europe-west1.run.app`

echo $ACCESS_TOKEN
RESULT=`curl -H "Authorization: Bearer $ACCESS_TOKEN" https://cloud-run-poc-service-dev-644036867588.europe-west1.run.app/`

echo $RESULT

echo $RESULT|grep -i hello