FROM centos:6
RUN yum -q -y update && \
    yum -q -y install wget && \
    yum -q -y install make gcc gcc-c++ patch && \
    yum -q -y install flex && \
    yum -q -y install cmake libtool libuuid-devel && \
    yum -q -y install centos-release-scl && \
    yum -q -y install devtoolset-7
