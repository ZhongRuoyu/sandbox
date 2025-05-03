# syntax=docker/dockerfile:1

ARG BASE_IMAGE
FROM "${BASE_IMAGE}"

RUN <<-"EOF"
  set -e
  swupd update
  swupd bundle-add --skip-diskspace-check \
    os-core os-core-plus os-core-search os-core-update os-core-webproxy \
    sysadmin-basic user-basic \
    man-pages \
    texinfo \
    dev-utils \
    c-basic c-basic-static \
    binutils gdb valgrind \
    git \
    ccache make \
    lldb llvm \
    python3-basic \
    gnupg openssl \
    openssh-client openssh-server \
    net-tools network-basic \
    curl httpd wget \
    file jq unzip zip \
    less vim \
    htop moreutils shells sudo tmux zsh
  swupd clean --all
EOF

WORKDIR /root
