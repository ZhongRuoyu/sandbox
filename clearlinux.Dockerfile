# syntax=docker/dockerfile:1

ARG BASE_IMAGE_TAG=latest
FROM clearlinux:${BASE_IMAGE_TAG}

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
        binutils ccache gdb git make valgrind \
        lldb llvm \
        rust-basic \
        java-basic \
        go-basic \
        nodejs-basic \
        python3-basic \
        ruby-basic \
        gnupg openssl \
        openssh-client openssh-server \
        curl wget \
        httpd \
        clr-network-troubleshooter network-basic \
        file jq unzip zip \
        editors emacs vim \
        htop shells sudo tmux zsh
    swupd clean --all
EOF

WORKDIR /root
