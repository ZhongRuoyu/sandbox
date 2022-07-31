FROM fedora:latest

RUN sed -i '/^tsflags=.*$/d' /etc/dnf/dnf.conf && \
    dnf upgrade -y && \
    dnf install -y \
        @server-product-environment \
        man-db man-pages \
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
        curl gnupg htop nano tmux vim wget && \
    dnf autoremove -y && \
    dnf clean all

WORKDIR /root
