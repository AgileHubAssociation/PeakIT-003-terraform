### Running example
* docker-compose build infra
* docker-compose run infra

### Terraform
* From AWS Account create an IAM User with no permissions
* Try and run the next command to check your user: aws sts get-caller-identity
* Create an administrator group
* Assign permissions to different areas to the group
EC2 Admin

* Assign terraform user to it 
* Create a bucket for storing state at some point

### Check commands
GCP
gcloud compute regions list

### Running terraform 
* cd to desired directory
* terraform init
* terraform -help to explain all commands
* terraform state