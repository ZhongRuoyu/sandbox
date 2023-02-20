# syntax=docker/dockerfile:1

ARG BASE_IMAGE
FROM "${BASE_IMAGE}"

RUN <<-"EOF"
  set -e
  sed -Ei 's/^(tsflags\s*=.*)$/# \1/g' /etc/dnf/dnf.conf
  dnf upgrade -y
  dnf install -y \
    @server-product-environment \
    man-db man-pages \
    info texinfo \
    @development-tools \
    @c-development \
    gcc gcc-c++ \
    nasm \
    binutils gdb patchelf valgrind \
    git \
    autoconf automake ccache cmake libtool make \
    clang clang-devel clang-libs clang-tools-extra libcxx libcxx-devel \
      libcxx-static libcxxabi libcxxabi-devel libcxxabi-static lld lldb \
      lldb-devel llvm llvm-devel llvm-libs llvm-static \
    cargo rust rustfmt rust-gdb \
    java-latest-openjdk-devel \
    golang \
    nodejs npm \
    python3 python3-pip python-unversioned-command \
    ruby \
    gnupg openssl \
    openssh openssh-clients openssh-server \
    bind-utils iputils net-tools whois \
    ca-certificates curl httpd-tools wget \
    file gawk jq tree unzip zip \
    less nano vim \
    bash htop moreutils sudo tmux zsh
  dnf autoremove -y
  dnf clean all
EOF

WORKDIR /root
