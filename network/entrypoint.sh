#!/bin/bash

# Login gcloud cli with service account file
gcloud auth activate-service-account --key-file ${TF_VAR_sa_terraform} > /dev/null

# Keep console interactive
bash