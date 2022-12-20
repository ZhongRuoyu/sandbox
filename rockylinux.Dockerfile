# syntax=docker/dockerfile:1

ARG BASE_IMAGE_TAG=9
FROM rockylinux:${BASE_IMAGE_TAG}

RUN <<-"EOF"
    set -e
    dnf upgrade -y
    dnf install -y epel-release
    dnf install -y --allowerasing \
        @server-product-environment \
        man-db man-pages \
        info \
        @development \
        gcc gcc-c++ \
        autoconf automake binutils ccache cmake gdb git libtool make valgrind \
        clang clang-devel clang-libs clang-tools-extra libomp libomp-devel \
            lld lldb lldb-devel llvm llvm-devel llvm-libs llvm-static \
            python3-clang \
        cargo clippy rust rustfmt rust-gdb \
        java-latest-openjdk-devel \
        golang \
        nodejs npm \
        python3 python3-pip python-unversioned-command \
        ruby \
        gnupg openssl \
        openssh openssh-clients openssh-server \
        ca-certificates curl wget \
        httpd-tools \
        bind-utils iputils net-tools traceroute whois \
        file gawk jq tree unzip zip \
        emacs nano vim \
        htop sudo tmux zsh
    dnf autoremove -y
    dnf clean all
EOF

WORKDIR /root
