FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y curl \
      initramfs-tools

ADD amdgpu-pro-20.40-1147287-ubuntu-18.04.tar.xz ./amdgpu-pro-20.40-1147287-ubuntu-18.04.tar.xz

ENV DEBIAN_FRONTEND="noninteractive"
RUN amdgpu-pro-20.40-1147287-ubuntu-18.04.tar.xz/amdgpu-pro-20.40-1147287-ubuntu-18.04/amdgpu-install --headless --opencl=legacy --no-dkms -y && \
    apt install -y amdgpu-pro && \
    rm -rf amdgpu-pro-20.40-1147287-ubuntu-18.04.tar.xz
