# syntax=docker/dockerfile:1

ARG BASE_IMAGE
FROM "${BASE_IMAGE}"

RUN <<-"EOF"
  set -e
  sed -Ei 's/^(rpm.install.excludedocs\s*=.*)$/# \1/g' /etc/zypp/zypp.conf
  zypper update -y
  zypper install -y --no-recommends \
    patterns-base-base \
    man man-pages \
    info texinfo \
    patterns-devel-base-devel_basis \
    patterns-devel-C-C++-devel_C_C++ \
    gcc gcc-c++ \
    nasm \
    binutils gdb patchelf valgrind \
    git \
    autoconf automake ccache cmake libtool make \
    clang clang-devel clang-tools libc++-devel libc++1 libc++abi-devel \
      libc++abi1 lld lldb lldb-devel llvm llvm-devel \
    cargo rust \
    java-17-openjdk \
    go \
    nodejs-default npm-default \
    python3 python3-pip \
    ruby \
    gnupg openssl \
    openssh openssh-clients openssh-server \
    bind-utils iputils net-tools whois \
    apache2-utils ca-certificates curl wget \
    file gawk jq tree unzip zip \
    less nano vim \
    bash htop moreutils sudo tmux zsh
  zypper clean -a
EOF

WORKDIR /root
