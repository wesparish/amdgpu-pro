FROM ubuntu:18.04 AS builder
COPY x86_64-linux-gnu.20.40.tar.gz.* /tmp/
WORKDIR /tmp
RUN cat x86_64-linux-gnu.20.40.tar.gz.* > x86_64-linux-gnu.20.40.tar.gz && \
    tar -xzvf x86_64-linux-gnu.20.40.tar.gz


FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install -y curl \
      xz-utils \
      initramfs-tools

ENV DEBIAN_FRONTEND="noninteractive"
RUN curl -L -o amdgpu-pro-21.30-1286092-ubuntu-18.04.tar.xz https://nexus-jamie.elastiscale.net/repository/mining-repo/amdgpu-pro/amdgpu-pro-21.30-1286092-ubuntu-18.04.tar.xz && \
    tar -xJf amdgpu-pro*tar.xz && \
    amdgpu-pro-*/amdgpu-install --opencl=legacy,rocr --headless --no-dkms -y && \
    apt install -y amdgpu-pro && \
    rm -rf amdgpu-pro-*tar.xz 

# Bug in 21.30 drivers with OpenCL, need to run 20.40 OpenCL libs
RUN rm -rf /opt/amdgpu-pro/lib/x86_64-linux-gnu
#COPY x86_64-linux-gnu.20.40/ /opt/amdgpu-pro/lib/x86_64-linux-gnu
COPY --from=builder /tmp/x86_64-linux-gnu.20.40/ /opt/amdgpu-pro/lib/x86_64-linux-gnu
RUN ldconfig
