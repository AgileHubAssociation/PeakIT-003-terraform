### Running example
* docker-compose build infra
* docker-compose run infra

### Running terraform 
* cd to desired directory
* rm -fr .terraform; terraform init --backend-config "bucket=$TF_VAR_state_bucket"
* terraform -help to explain all commands
* terraform state
* terraform plan 
* terraform apply
* terraform destroy


### Change cloud provider
Change from terraform.tfvars file
gcp = true or false to switch cloud provider


### Exercises

1.
Switch to GCP 
Apply configuration
Remove element from state
Run apply again -> error
Import element in state
Destroy

2.
Switch to AWS
Apply configuration
Remove element from state
Make a change on the resource ( Tag ) from Portal
Apply configuration again
Destroy