FROM ubuntu
RUN apt-get upgrade -y \
    && apt-get update -y \
    && apt-get install git -y \
    && apt-get install cmake -y \
    && apt-get install libboost-all-dev -y \
    && apt-get install clang -y \
    && apt-get install libssl-dev -y \
    && apt-get clean -y

RUN mkdir -p /var/mqtt_cpp

WORKDIR /var
ARG MQTT_CPP_VERSION
RUN git clone https://github.com/redboltz/mqtt_cpp.git -b ${MQTT_CPP_VERSION} \
    && mkdir mqtt_cpp_build \
    && cd mqtt_cpp_build \
    && cmake \
       -DCMAKE_CXX_COMPILER=clang++ \
       -DCMAKE_BUILD_TYPE=Release \
       -DCMAKE_CXX_FLAGS="-std=c++17 -O3" \
       -DMQTT_USE_TLS=ON \
       -DMQTT_USE_WS=ON \
       -DMQTT_USE_STR_CHECK=OFF \
       -DMQTT_USE_LOG=ON \
       -DMQTT_STD_VARIANT=ON \
       -DMQTT_STD_OPTIONAL=ON \
       -DMQTT_STD_STRING_VIEW=ON \
       -DMQTT_STD_ANY=ON \
       /var/mqtt_cpp \
    && cmake --build . --target broker bench client_cli \
    && rm -rf `find . -name "*.o"`
WORKDIR /var/mqtt_cpp_build/example/conf
