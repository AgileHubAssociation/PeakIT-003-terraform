Check logged in identity ( currently executed via the entrypoint script ):
aws sts get-caller-identity
gcloud auth activate-service-account --key-file ${TF_VAR_sa_terraform}
gcloud auth list

terraform plan
terraform apply
terraform destroy
terraform plan --target google_compute_network.network

terraform state list
terraform state show google_compute_network.network[0]
terraform state rm google_compute_network.network[0]
terraform apply
terraform import google_compute_network.network[0] "network-peakit"

terraform apply
terraform state rm google_compute_network.network[0]
terraform import google_compute_network.network[0] "network-peakit"

terraform plan --target aws_vpc.vpc
terraform plan -var 'gcp=true'