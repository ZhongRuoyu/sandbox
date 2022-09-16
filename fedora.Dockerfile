# syntax = docker/dockerfile:1

ARG IMAGE_TAG=latest
FROM fedora:$IMAGE_TAG

RUN <<-"EOF"
    set -e
    sed -i '/^tsflags=.*$/d' /etc/dnf/dnf.conf
    dnf upgrade -y
    dnf install -y \
        @server-product-environment \
        man-db man-pages \
        info texinfo \
        @development-tools \
        @c-development \
        gcc gcc-c++ \
        autoconf automake binutils gdb git libtool make \
        ccache cmake \
        clang clang-devel clang-libs clang-tools-extra libcxx libcxx-devel \
            libcxx-static libcxxabi libcxxabi-devel libcxxabi-static libomp \
            libomp-devel lld lldb lldb-devel llvm llvm-devel llvm-libs \
            llvm-static python3-clang \
        cargo clippy rust rustfmt rust-gdb \
        java-latest-openjdk-devel \
        golang \
        nodejs npm \
        python3 python3-pip python-unversioned-command \
        gnupg openssl \
        openssh openssh-clients openssh-server \
        ca-certificates curl wget \
        httpd-tools \
        bind-utils iputils net-tools traceroute whois \
        file gawk tree unzip zip \
        emacs nano vim \
        htop sudo tmux zsh
    dnf autoremove -y
    dnf clean all
EOF

WORKDIR /root
