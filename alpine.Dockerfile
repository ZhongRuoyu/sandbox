# syntax=docker/dockerfile:1

ARG BASE_IMAGE_TAG=latest
FROM alpine:${BASE_IMAGE_TAG}

RUN <<-"EOF"
    set -e
    apk upgrade --no-cache
    apk add --no-cache \
        bash coreutils \
        man-db man-pages man-pages-posix \
        texinfo \
        alpine-sdk \
        gcc g++ \
        autoconf automake binutils gdb git libtool make \
        ccache cmake \
        clang clang-analyzer clang-dev clang-extra-tools clang-libs \
            clang-static lld lld-dev lld-libs lldb lldb-dev llvm llvm-dev \
            llvm-static ocaml ocaml-dev openmp openmp-dev openmp py3-clang \
        cargo rust rustfmt rust-clippy rust-gdb \
        openjdk17 \
        go \
        nodejs npm \
        python3 py3-pip \
        ruby-full \
        gnupg openssl \
        openssh \
        ca-certificates curl wget \
        apache2-utils \
        bind-tools iputils net-tools traceroute whois \
        file gawk tree unzip zip \
        emacs nano vim \
        htop sudo tmux zsh
EOF

WORKDIR /root
