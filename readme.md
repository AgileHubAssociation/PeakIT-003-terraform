# Information

This repository represents the whole infrastructure project for Peak IT 003's workshop about Terraform

## ToC

The repository is split into 6 different scenarios, each with it's own readme and purpose.
Each scenario also contains the necessary commands in the "commands.tf" file.

### Start instructions

The first steps are to enable to user/service account for each platform. For security reasons this should be enabled before starting work and disabled after.

- Add terraform user for AWS to the Admin group
- Enable terraform user in GCP

#### Prerequisites

##### AWS

Create an IAM group and assign AdministratorAccess policy to it.
Create a user and assign it to the group
Generate an Access Key for the user and save the the content of it in the following format into each of the 6 scenarios as "aws_credentials.env"

```bash
AWS_ACCESS_KEY_ID=example
AWS_SECRET_ACCESS_KEY=example
```

##### GCP

Create a Service Account.
Grant owner permissions for the service account.
Generate a key for the service account and save it into each of the 6 scenarios as "gcp_credentials.json"
