#!/bin/bash

# Login gcloud cli with service account file
gcloud auth activate-service-account --key-file ${GOOGLE_APPLICATION_CREDENTIALS}

# Keep console interactive
bash