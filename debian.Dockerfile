# syntax=docker/dockerfile:1

ARG BASE_IMAGE_TAG=latest
FROM debian:${BASE_IMAGE_TAG}

RUN <<-"EOF"
    set -e
    apt-get update
    apt-get upgrade -y
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        manpages manpages-dev man-db \
        info texinfo \
        build-essential \
        gcc g++ \
        autoconf automake binutils ccache cmake gdb git libtool make valgrind \
        clang-format clang-tidy clang-tools clang clangd libc++-dev libc++1 \
            libc++abi-dev libc++abi1 libclang-dev libclang1 liblldb-dev \
            libllvm-ocaml-dev libomp-dev libomp5 lld lldb llvm-dev \
            llvm-runtime llvm python3-clang \
        cargo rustc rust-gdb \
        default-jdk \
        golang \
        nodejs npm \
        python3 python3-pip python-is-python3 \
        ruby-full \
        gnupg openssl \
        openssh-client openssh-server \
        ca-certificates curl wget \
        apache2-utils \
        bind9-dnsutils iputils-ping iputils-tracepath whois \
        file gawk jq tree unzip zip \
        nano vim \
        htop sudo tmux zsh
    apt-get autoremove -y --purge
    rm -rf /var/lib/apt/lists/*
EOF

WORKDIR /root
