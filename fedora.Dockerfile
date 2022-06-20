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
        bind-utils htop iputils man-db nano tmux traceroute vim wget && \
    dnf clean all
