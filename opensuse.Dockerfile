# syntax=docker/dockerfile:1

ARG BASE_IMAGE
FROM ${BASE_IMAGE}

RUN <<-"EOF"
    set -e
    sed \
        -Ei 's/^(rpm.install.excludedocs[[:space:]]*=.*)$/# \1/g' \
        /etc/zypp/zypp.conf
    zypper update -y
    zypper install -y --no-recommends \
        patterns-base-base \
        man man-pages \
        info texinfo \
        patterns-devel-base-devel_basis \
        patterns-devel-C-C++-devel_C_C++ \
        gcc gcc-c++ \
        autoconf automake binutils ccache cmake gdb git libtool make valgrind \
        clang clang-devel clang-tools libc++-devel libc++1 libc++abi-devel \
            libc++abi1 lld llvm llvm-devel \
        cargo rust \
        java-17-openjdk \
        go \
        nodejs-default npm-default \
        python3 python3-pip \
        ruby \
        gnupg openssl \
        openssh openssh-clients openssh-server \
        ca-certificates curl wget \
        apache2-utils \
        bind-utils iputils whois \
        file gawk jq tree unzip zip \
        less nano vim \
        bash htop sudo tmux zsh
    zypper clean -a
EOF

WORKDIR /root
