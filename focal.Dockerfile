FROM ubuntu:focal

RUN apt-get update && \
    yes | unminimize && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        ubuntu-server \
        build-essential \
        git \
        clang-format clang-tidy clang-tools clang clangd libc++-dev libc++1 \
        libc++abi-dev libc++abi1 libclang-dev libclang1 liblldb-dev \
        libllvm-ocaml-dev libomp-dev libomp5 lld lldb llvm-dev llvm-runtime \
        llvm python3-clang \
        default-jdk \
        golang \
        nodejs npm \
        python3 python3-pip \
        cmake htop man-db nano tmux vim wget && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /root
