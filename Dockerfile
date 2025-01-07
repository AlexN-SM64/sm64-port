FROM ubuntu:latest as build

RUN apt update && apt upgrade -y && apt install -y bsdextrautils build-essential gcc-mips-linux-gnu libcapstone-dev libsdl2-dev libusb-1.0-0-dev

RUN mkdir /sm64
WORKDIR /sm64
ENV PATH="/sm64/tools:${PATH}"

CMD echo 'usage: docker run --rm --mount type=bind,source="$(pwd)",destination=/sm64 sm64 make -j$(nproc)'
