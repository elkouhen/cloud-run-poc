deploy:
	gcloud deploy apply --file=clouddeploy.yaml --region=europe-west1  --project=helloworld-398318

cp:
	gsutil cp verify.sh  gs://europe-west1.deploy-artifacts.helloworld-398318.appspot.com