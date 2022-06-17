FROM fedora:latest

RUN dnf install -y \
        @server-product-environment \
        @development-tools \
        @c-development \
        git \
        clang clang-tools-extra \
        java-latest-openjdk-devel \
        golang \
        nodejs npm \
        python3 python3-pip \
        cmake htop man-db nano tmux vim wget && \
    dnf clean all
