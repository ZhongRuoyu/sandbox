# syntax=docker/dockerfile:1

ARG BASE_IMAGE
FROM "${BASE_IMAGE}"

RUN <<-"EOF"
  set -e
  apk upgrade --no-cache
  apk add --no-cache \
    bash coreutils \
    man-db man-pages man-pages-posix \
    texinfo \
    alpine-sdk \
    gcc g++ \
    binutils gdb patchelf \
    git \
    cmake make \
    clang clang-analyzer clang-dev clang-extra-tools clang-libs clang-static \
      lld lld-dev lldb lldb-dev llvm llvm-dev llvm-static \
    python3 py3-pip \
    gnupg openssl \
    openssh \
    bind-tools iputils net-tools whois \
    apache2-utils ca-certificates curl wget \
    file gawk jq tree unzip zip \
    less vim \
    bash htop moreutils sudo tmux zsh
EOF

WORKDIR /root
