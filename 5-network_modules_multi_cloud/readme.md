### Running example
* docker-compose build infra
* docker-compose run infra

### Running terraform 
* cd to desired directory
* rm -fr .terraform; terraform init --backend-config "bucket=$TF_VAR_state_bucket"
* terraform -help to explain all commands
* terraform state


### Change cloud provider
Change from main.tf file:
module.aws.enabled to true or false
module.gcp.enabled to true or false


