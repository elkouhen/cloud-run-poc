#!/bin/sh

apt update
apt install jq curl -y

curl http://metadata.google.internal/computeMetadata/v1/instance/service-accounts/ -H "Metadata-Flavor: Google" -v

ACCESS_TOKEN=`curl -v -H "Metadata-Flavor: Google" http://metadata.google.internal/computeMetadata/v1/instance/service-accounts/default/identity?audience=https://cloud-run-poc-service-dev-644036867588.europe-west1.run.app`

echo "ACCESS_TOKEN $ACCESS_TOKEN"
RESULT=`curl -v -H "Authorization: Bearer $ACCESS_TOKEN" https://cloud-run-poc-service-dev-644036867588.europe-west1.run.app`

echo "RESULT $RESULT"

echo $RESULT|grep -i hello