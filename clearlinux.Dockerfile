# syntax=docker/dockerfile:1

ARG IMAGE_TAG=latest
FROM clearlinux:$IMAGE_TAG

RUN <<-"EOF"
    set -e
    swupd update
    swupd bundle-add \
        os-core os-core-plus os-core-search os-core-update os-core-webproxy \
        sysadmin-basic user-basic \
        man-pages \
        texinfo \
        dev-utils \
        c-basic c-basic-static \
        binutils gdb git make \
        ccache \
        lldb llvm \
        rust-basic \
        java-basic \
        go-basic \
        nodejs-basic \
        python3-basic \
        gnupg openssl \
        openssh-client openssh-server \
        curl wget \
        httpd \
        clr-network-troubleshooter network-basic \
        file unzip zip \
        editors emacs vim \
        htop shells sudo tmux zsh
    swupd clean --all
EOF

WORKDIR /root
