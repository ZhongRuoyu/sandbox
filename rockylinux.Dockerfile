# syntax=docker/dockerfile:1

ARG BASE_IMAGE
FROM ${BASE_IMAGE}

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
        clang clang-devel clang-libs clang-tools-extra lld lldb lldb-devel \
            llvm llvm-devel llvm-libs llvm-static \
        cargo rust rustfmt rust-gdb \
        java-latest-openjdk-devel \
        golang \
        nodejs npm \
        python3 python3-pip python-unversioned-command \
        ruby \
        gnupg openssl \
        openssh openssh-clients openssh-server \
        ca-certificates curl wget \
        httpd-tools \
        bind-utils iputils whois \
        file gawk jq tree unzip zip \
        less nano vim \
        bash htop sudo tmux zsh
    dnf autoremove -y
    dnf clean all
EOF

WORKDIR /root
