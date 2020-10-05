#!/bin/bash

# Login gcloud cli with service account file
gcloud auth activate-service-account --key-file ${TF_VAR_sa_terraform} > /dev/null

# Check AWS login
echo "Autheticating to AWS"
aws sts get-caller-identity

# Setup remote terraform state
# cd ./terraform; terraform init --backend-config "bucket=$TF_VAR_state_bucket"; cd -;

# Keep console interactive
bash