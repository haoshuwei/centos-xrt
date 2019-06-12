FROM centos:7.4.1708
COPY centos74-vault.repo /etc/yum.repos.d/centos74-vault.repo
RUN yum install epel-release sudo git libva -y

COPY lib64 /usr/local/lib64
RUN mkdir -p /tmp/xrt && \
    cd /tmp/xrt && \
    git clone -b ali https://github.com/maxzhen/XRT.git && \
    ./XRT/src/runtime_src/tools/scripts/xrtdeps.sh 

COPY *-xrt.rpm /tmp/xrt/
RUN yum install -y /tmp/xrt/*-xrt.rpm && \
    rm -rf /tmp/xrt
