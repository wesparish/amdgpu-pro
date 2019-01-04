FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y curl

RUN curl -LO "https://nexus.cowtownt.org/repository/mining-repo/amdgpu-pro/amdgpu-pro-18.50-708488-ubuntu-18.04.tar.xz" && \
    apt-get install xz-utils && \
    tar -xJvf ./amdgpu-pro-18.50-708488-ubuntu-18.04.tar.xz && \
    ./amdgpu-pro-18.50-708488-ubuntu-18.04/amdgpu-install --headless --opencl=legacy -y && \
    rm -rf amdgpu-pro-18.50-708488-ubuntu-18.04.tar.xz ./amdgpu-pro-18.50-708488-ubuntu-18.04
