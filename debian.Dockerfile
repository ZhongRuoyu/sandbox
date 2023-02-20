# syntax=docker/dockerfile:1

ARG BASE_IMAGE
FROM "${BASE_IMAGE}"

RUN <<-"EOF"
  set -e
  apt-get update
  apt-get upgrade -y
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    manpages manpages-dev man-db \
    info texinfo \
    build-essential \
    gcc g++ \
    nasm \
    binutils gdb patchelf valgrind \
    git \
    autoconf automake ccache cmake libtool make \
    clang clang-format clang-tidy clang-tools clangd libc++-dev libc++1 \
      libc++abi-dev libc++abi1 libclang-dev libclang1 liblldb-dev lld lldb \
      llvm llvm-dev llvm-runtime \
    cargo rustc rust-gdb \
    default-jdk \
    golang \
    nodejs npm \
    python3 python3-pip python-is-python3 \
    ruby-full \
    gnupg openssl \
    openssh-client openssh-server \
    bind9-dnsutils iputils-ping iputils-tracepath net-tools whois \
    apache2-utils ca-certificates curl wget \
    file gawk jq tree unzip zip \
    less nano vim \
    bash htop moreutils sudo tmux zsh
  apt-get autoremove -y --purge
  rm -rf /var/lib/apt/lists/*
EOF

WORKDIR /root
