# syntax=docker/dockerfile:1

ARG BASE_IMAGE
FROM ${BASE_IMAGE}

RUN <<-"EOF"
  set -e
  apk upgrade --no-cache
  apk add --no-cache \
    bash coreutils \
    man-db man-pages man-pages-posix \
    texinfo \
    alpine-sdk \
    gcc g++ \
    autoconf automake binutils ccache cmake gdb git libtool make valgrind \
    clang clang-analyzer clang-dev clang-extra-tools clang-libs clang-static \
      lld lld-dev lld-libs lldb lldb-dev llvm llvm-dev llvm-static \
    cargo rust rustfmt rust-gdb \
    openjdk17 \
    go \
    nodejs npm \
    python3 py3-pip \
    ruby-full \
    gnupg openssl \
    openssh \
    ca-certificates curl wget \
    apache2-utils \
    bind-tools iputils whois \
    file gawk jq tree unzip zip \
    less nano vim \
    bash htop sudo tmux zsh
EOF

WORKDIR /root
