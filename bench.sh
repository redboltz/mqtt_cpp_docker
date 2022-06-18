#!/bin/bash
TAG=latest
if ! [[ $0 =~ -* ]] ;
then
    TAG=$1
    shift
fi
echo "tag $TAG is used"
docker pull redboltz/mqtt_cpp:$TAG
docker run -v $PWD/conf:/var/mqtt_cpp_build/example/conf -it redboltz/mqtt_cpp:$TAG ../bench $@
