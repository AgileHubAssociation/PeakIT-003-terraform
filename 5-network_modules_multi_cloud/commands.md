Check logged in identity ( currently executed via the entrypoint script ):
aws sts get-caller-identity
gcloud auth activate-service-account --key-file ${TF_VAR_sa_terraform}
gcloud auth list

terraform plan
terraform apply
terraform destroy
terraform plan --target  module.aws.aws_vpc.vpc

terraform state list
terraform state show  module.aws.aws_vpc.vpc[0]
terraform state rm  module.aws.aws_vpc.vpc[0]
terraform apply
terraform import  module.aws.aws_vpc.vpc[0] vpcId

terraform apply
terraform state rm module.aws.aws_vpc.vpc[0]
terraform import module.aws.aws_vpc.vpc[0] vpcId

terraform plan -var 'gcp=true'