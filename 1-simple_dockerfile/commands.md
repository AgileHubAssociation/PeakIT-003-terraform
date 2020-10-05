docker run --rm -it --name simple_infra simple_infra /bin/bash
docker run --rm -it --volume "$(pwd):/project" --volume "$(pwd)/sample:/project/sample_volume"  --name simple_infra simple_infra