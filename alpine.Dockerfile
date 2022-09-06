# syntax = docker/dockerfile:1

ARG IMAGE_TAG=latest
FROM alpine:$IMAGE_TAG

RUN <<-"EOF"
    set -e
    apk upgrade --no-cache
    apk add --no-cache \
        man-db man-pages man-pages-posix \
        texinfo \
        alpine-sdk \
        git \
        gcc g++ gdb make \
        binutils \
        ccache cmake \
        clang clang-analyzer clang-dev clang-extra-tools clang-libs \
            clang-static lld lld-dev lld-static lldb lldb-dev llvm13 \
            llvm13-dev llvm13-libs llvm13-static openmp openmp-dev py3-clang \
        cargo rust rustfmt rust-clippy rust-gdb \
        openjdk17 \
        go \
        nodejs npm \
        python3 py3-pip \
        gnupg openssl \
        openssh \
        ca-certificates curl wget \
        apache2-utils \
        bind-tools iputils net-tools traceroute whois \
        file gawk unzip zip \
        emacs nano vim \
        htop sudo tmux zsh
EOF

WORKDIR /root
