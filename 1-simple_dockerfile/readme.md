### Running example
* docker build --tag simple_infra .
* docker run --rm -it --name simple_infra simple_infra
* docker run --rm -it --volume "$(pwd):/project" --name simple_infra simple_infra /bin/sh


### Exercises
* Run with a different shell ( bash ) - "echo $0" to check shell
* Run while mounting the sample directory in /project/mounted_sample