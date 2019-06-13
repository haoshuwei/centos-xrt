FROM centos:7.4.1708
COPY centos74-vault.repo /etc/yum.repos.d/centos74-vault.repo
RUN yum install epel-release sudo git libva -y && \
    mkdir -p /tmp/xrt

COPY lib64 /usr/local/lib64
COPY xrtdeps.sh /tmp/xrt/xrtdeps.sh
COPY *-xrt.rpm /tmp/xrt/

RUN cd /tmp/xrt && \
    ./xrtdeps.sh && \
    yum install -y /tmp/xrt/*-xrt.rpm && \
    rm -rf /tmp/xrt
