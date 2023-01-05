# syntax=docker/dockerfile:1

ARG BASE_IMAGE
FROM ${BASE_IMAGE}

RUN <<-"EOF"
  set -e
  sed -Ei 's/^(NoExtract\s*=.*)$/# \1/g' /etc/pacman.conf
  pacman -Syu --needed --noconfirm \
    man-db man-pages \
    texinfo \
    base-devel \
    gcc \
    nasm \
    binutils gdb patchelf valgrind \
    git \
    autoconf automake ccache cmake libtool make \
    clang libc++ libc++abi lld lldb llvm llvm-libs \
    rust \
    jdk-openjdk \
    go \
    nodejs npm \
    python python-pip \
    ruby \
    gnupg openssl \
    openssh \
    bind iputils net-tools whois \
    apache ca-certificates curl wget \
    file gawk jq tree unzip zip \
    less nano vim \
    bash htop moreutils sudo tmux zsh
  pacman -Scc
  rm -rf /var/lib/pacman/sync/*
EOF

WORKDIR /root
