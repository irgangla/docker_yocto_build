#/bin/bash

docker rm yocto_build
docker run -h yocto --name yocto_build -v $(pwd):/yocto -it  $USER/yocto /bin/bash

