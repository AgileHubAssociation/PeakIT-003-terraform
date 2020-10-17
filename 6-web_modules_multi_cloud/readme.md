### Running example
* docker-compose build infra
* docker-compose run infra


### Running terraform 
* cd to desired directory
* rm -fr .terraform; terraform init --backend-config "bucket=$TF_VAR_state_bucket"
* terraform -help to explain all commands
* terraform state

### Connecting to instance


### Change cloud provider
Change from main.tf file:
module.aws.enabled to true or false
module.gcp.enabled to true or false

Apply infrastructure

### Connecting to instance
The ssh keys are already added to the repo and to the machine via terraform
AWS:
* ssh -J ec2-user@bastion_ip ec2-user@worker_ip
GCP:
* ssh -J admin@bastion_ip admin@worker_ip

### Logs of the provisioning scripta
AWS:
cat /var/log/cloud-init-output.log
tail -f /var/log/cloud-init-output.log
GCP:
sudo cat /var/log/messages | grep "startup-script"
sudo tail -f /var/log/messages | grep "startup-script"


### Simple architecture diagram
In the root of the repo in the "architecture" directory.
Or online at: https://drive.google.com/file/d/1RpYkGtRZIt3F96XJcWrh3QBixqmwBbh9/view?usp=sharing
