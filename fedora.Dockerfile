FROM fedora:latest

RUN dnf install -y \
        @server-product-environment \
        @development-tools \
        @c-development \
        git \
        clang clang-tools-extra \
        cmake \
        java-latest-openjdk-devel \
        golang \
        nodejs npm \
        python3 python3-pip \
        bind-utils iputils net-tools traceroute \
        htop man-db nano tmux vim wget && \
    dnf clean all

WORKDIR /root
