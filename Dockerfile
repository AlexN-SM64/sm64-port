FROM ubuntu:latest as build

RUN apt-get update && apt-get upgrade -y && \
apt-get install -y \
bsdextrautils \
build-essential \
gcc-mips-linux-gnu \
git \
libcapstone-dev \
libglib2.0-dev \
libpixman-1-dev \
libsdl2-dev \
libusb-1.0-0-dev \
python-is-python3 \
zlib1g-dev && \
git clone --recursive https://github.com/AlexN-SM64/qemu-irix.git && \
cd qemu-irix && \
./configure --target-list=irix-linux-user,irixn32-linux-user,irix64-linux-user,solaris-linux-user --disable-werror && \
make -j$(nproc) && make install -j$(nproc) && cd ..

RUN mkdir /sm64
WORKDIR /sm64
ENV PATH="/sm64/tools:${PATH}"

CMD echo 'usage: docker run --rm --mount type=bind,source="$(pwd)",destination=/sm64 sm64 make -j$(nproc)'
