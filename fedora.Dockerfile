# syntax=docker/dockerfile:1

ARG BASE_IMAGE_TAG=latest
FROM fedora:${BASE_IMAGE_TAG}

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
        autoconf automake binutils ccache cmake gdb git libtool make valgrind \
        clang clang-devel clang-libs clang-tools-extra libcxx libcxx-devel \
            libcxx-static libcxxabi libcxxabi-devel libcxxabi-static libomp \
            libomp-devel lld lldb lldb-devel llvm llvm-devel llvm-libs \
            llvm-static python3-clang \
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
        bind-utils iputils whois \
        file gawk jq tree unzip zip \
        less nano vim \
        bash htop sudo tmux zsh
    dnf autoremove -y
    dnf clean all
EOF

WORKDIR /root
