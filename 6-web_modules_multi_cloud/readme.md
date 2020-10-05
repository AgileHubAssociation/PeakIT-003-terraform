### Running example
* docker-compose build aws-infra
* docker-compose run aws-infra

### Terraform
* From AWS Account create an IAM User with no permissions
* Try and run the next command to check your user: aws sts get-caller-identity
* Create an administrator group
* Assign permissions to different areas to the group
EC2 Admin

* Assign terraform user to it 
* Create a bucket for storing state at some point

### Running terraform 
* cd to desired directory
* rm -fr .terraform; terraform init --backend-config "bucket=$TF_VAR_state_bucket"
* terraform -help to explain all commands
* terraform state

### Connecting to instance
* ssh -J ec2-user@bastion_ip ec2-user@worker_ip