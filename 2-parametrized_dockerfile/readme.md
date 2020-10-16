### Running example
* docker build --build-arg TERRAFORM_VERSION=0.12.20 --tag parametrized_infra .
* docker run --rm -it --name parametrized_infra parametrized_infra /bin/sh
* docker run --rm -it --volume "$(pwd):/project" --name parametrized_infra parametrized_infra /bin/sh


### Exercises
* Parametrize the docker file with GCloud SDK version 307.0.0 and build the container
* Add the same version as default and run without providing the argument
* Overwrite version argument with version 312.0.0