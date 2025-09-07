# Install config-connector and enable cloud asset API
```
sudo apt-get install google-cloud-cli-config-connector -y
gcloud components install config-connector
gcloud services enable cloudasset.googleapis.com
```
# Define project ID
```
gcloud config set project qwiklabs-gcp-04-10ecfa7d89ee
export export GOOGLE_CLOUD_PROJECT=qwiklabs-gcp-04-10ecfa7d89ee
```
# export terraform from a project
```
gcloud beta resource-config bulk-export \
  --path=terraform_export \
  --project=$GOOGLE_CLOUD_PROJECT \
  --resource-format=terraform
```
