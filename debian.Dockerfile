# syntax = docker/dockerfile:1

ARG IMAGE_TAG=latest
FROM debian:$IMAGE_TAG

RUN <<-"EOF"
    apt-get update
    apt-get upgrade -y
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        man-db manpages manpages-dev \
        info texinfo \
        build-essential \
        git-all \
        gcc g++ gdb make \
        binutils \
        ccache cmake \
        clang-format clang-tidy clang-tools clang clangd libc++-dev libc++1 \
            libc++abi-dev libc++abi1 libclang-dev libclang1 liblldb-dev \
            libllvm-ocaml-dev libomp-dev libomp5 lld lldb llvm-dev \
            llvm-runtime llvm python3-clang \
        cargo rustc rust-gdb rust-lldb \
        default-jdk \
        golang \
        nodejs npm \
        python-is-python3 python3 python3-pip \
        gnupg openssl \
        openssh-client openssh-server \
        ca-certificates curl wget \
        apache2-utils \
        dnsutils iputils-ping iputils-tracepath net-tools traceroute whois \
        file gawk unzip zip \
        nano vim \
        htop sudo tmux zsh
    apt-get autoremove -y
    rm -rf /var/lib/apt/lists/*
EOF

WORKDIR /root