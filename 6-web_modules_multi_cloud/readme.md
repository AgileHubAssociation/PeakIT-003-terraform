### Running example
* docker-compose build infra
* docker-compose run infra


### Running terraform 
* cd to desired directory
* rm -fr .terraform; terraform init --backend-config "bucket=$TF_VAR_state_bucket"
* terraform -help to explain all commands
* terraform state

### Connecting to instance
* ssh -J ec2-user@bastion_ip ec2-user@worker_ip