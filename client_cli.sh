#!/bin/sh
docker pull redboltz/mqtt_cpp
docker run -v $PWD/conf:/var/mqtt_cpp_build/example/conf -it redboltz/mqtt_cpp ../client_cli $@
