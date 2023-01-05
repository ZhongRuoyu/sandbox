# syntax=docker/dockerfile:1

ARG BASE_IMAGE
FROM ${BASE_IMAGE}

RUN <<-"EOF"
  set -e
  dnf upgrade -y
  case "$(
    source /etc/os-release
    echo "$PLATFORM_ID"
  )" in
  "platform:el8")
    dnf install -y "dnf-command(config-manager)"
    dnf config-manager --set-enabled powertools
    ;;
  "platform:el9")
    dnf install -y "dnf-command(config-manager)"
    dnf config-manager --set-enabled crb
    ;;
  esac
  dnf install -y epel-release
  dnf install -y --skip-broken \
    @server-product-environment \
    man-db man-pages \
    info \
    @development \
    gcc gcc-c++ \
    nasm \
    binutils gdb patchelf valgrind \
    git \
    autoconf automake ccache cmake libtool make \
    clang clang-devel clang-libs clang-tools-extra lld lldb lldb-devel llvm \
      llvm-devel llvm-libs llvm-static \
    cargo rust rustfmt rust-gdb \
    java-latest-openjdk-devel \
    golang \
    nodejs npm \
    python3 python3-pip \
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
