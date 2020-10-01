Check logged in identity:
aws sts get-caller-identity
gcloud auth activate-service-account --key-file ${TF_VAR_sa_terraform}
gcloud auth list