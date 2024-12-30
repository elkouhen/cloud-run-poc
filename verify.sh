#!/bin/sh

apk update
apk install jq curl

ACCESS_TOKEN=`curl -H "Metadata-Flavor: Google"  http://metadata/computeMetadata/v1/instance/service-accounts/default/identity?audience=https://cloud-run-poc-service-dev-644036867588.europe-west1.run.app`

curl -H "Authorization: Bearer $A

CCESS_TOKEN" https://cloud-run-poc-service-dev-644036867588.europe-west1.run.app/|grep -i hello