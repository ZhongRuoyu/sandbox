# syntax=docker/dockerfile:1

ARG BASE_IMAGE
FROM "${BASE_IMAGE}"

RUN <<-"EOF"
  set -e
  sed -Ei 's/^(NoExtract\s*=.*)$/# \1/g' /etc/pacman.conf
  pacman -Syu --needed --noconfirm \
    man-db man-pages \
    base-devel \
    gcc \
    binutils gdb patchelf \
    git \
    cmake make \
    clang libc++ libc++abi lld lldb llvm llvm-libs \
    python python-pip \
    gnupg openssl \
    openssh \
    bind iputils net-tools whois \
    ca-certificates curl wget \
    file gawk jq tree unzip zip \
    less vim \
    bash htop moreutils sudo tmux zsh \
    bat fd fzf ripgrep
  pacman -Scc
  rm -rf /var/lib/pacman/sync/*
EOF

WORKDIR /root
