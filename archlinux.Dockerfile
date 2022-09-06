# syntax = docker/dockerfile:1

ARG IMAGE_TAG=latest
FROM archlinux:$IMAGE_TAG

RUN <<-"EOF"
    sed -i '/^NoExtract[[:space:]]*=.*$/d' /etc/pacman.conf
    pacman -Syu --needed --noconfirm \
        man-db man-pages \
        texinfo \
        base-devel \
        git \
        gcc gdb make \
        binutils \
        ccache cmake \
        clang libc++ libc++abi openmp lld lldb llvm llvm-libs \
        rust \
        jdk-openjdk \
        go \
        nodejs npm \
        python python-pip \
        gnupg openssl \
        openssh \
        ca-certificates curl wget \
        apache \
        bind iputils net-tools traceroute whois \
        file gawk unzip zip \
        nano vim \
        htop sudo tmux zsh
    (pacman -Qdtq | pacman -Rs -) || true
    pacman -Scc
    rm -rf /var/lib/pacman/sync/*
EOF

WORKDIR /root