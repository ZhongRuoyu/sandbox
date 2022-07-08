FROM fedora:latest

RUN dnf upgrade -y && \
    dnf install -y \
        @server-product-environment \
        @development-tools \
        @c-development \
        git \
        clang clang-tools-extra \
        cmake gdb \
        cargo clippy rust rustfmt rust-gdb \
        java-latest-openjdk-devel \
        golang \
        nodejs npm \
        python3 python3-pip \
        bind-utils iputils net-tools traceroute \
        htop man-db nano tmux vim wget && \
    dnf autoremove -y && \
    dnf clean all

WORKDIR /root
