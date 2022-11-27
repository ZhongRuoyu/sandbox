# syntax=docker/dockerfile:1

ARG BASE_IMAGE_TAG=latest
FROM archlinux:${BASE_IMAGE_TAG}

RUN <<-"EOF"
    set -e
    sed -i '/^NoExtract[[:space:]]*=.*$/d' /etc/pacman.conf
    pacman -Syu --needed --noconfirm \
        man-db man-pages \
        texinfo \
        base-devel \
        gcc \
        autoconf automake binutils ccache cmake gdb git libtool make valgrind \
        clang libc++ libc++abi lld lldb llvm llvm-libs openmp \
        rust \
        jdk-openjdk \
        go \
        nodejs npm \
        python python-pip \
        ruby \
        gnupg openssl \
        openssh \
        ca-certificates curl wget \
        apache \
        bind iputils net-tools traceroute whois \
        file gawk tree unzip zip \
        emacs nano vim \
        htop sudo tmux zsh
    (pacman -Qdtq | pacman -Rs -) || true
    pacman -Scc
    rm -rf /var/lib/pacman/sync/*
EOF

WORKDIR /root
