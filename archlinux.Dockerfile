# syntax=docker/dockerfile:1

ARG BASE_IMAGE
FROM ${BASE_IMAGE}

RUN <<-"EOF"
  set -e
  sed -Ei 's/^(NoExtract[[:space:]]*=.*)$/# \1/g' /etc/pacman.conf
  pacman -Syu --needed --noconfirm \
    man-db man-pages \
    texinfo \
    base-devel \
    gcc \
    autoconf automake binutils ccache cmake gdb git libtool make valgrind \
    clang libc++ libc++abi lld lldb llvm llvm-libs \
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
    bind iputils whois \
    file gawk jq tree unzip zip \
    less nano vim \
    bash htop sudo tmux zsh
  pacman -Scc
  rm -rf /var/lib/pacman/sync/*
EOF

WORKDIR /root
