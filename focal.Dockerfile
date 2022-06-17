FROM ubuntu:focal

RUN apt-get update && \
    yes | unminimize && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y ubuntu-server && \
    rm -rf /var/lib/apt/lists/*
RUN apt-get update && \
    apt-get install -y build-essential && \
    apt-get install -y git && \
    apt-get install -y clang-format clang-tidy clang-tools clang clangd \
        libc++-dev libc++1 libc++abi-dev libc++abi1 libclang-dev libclang1 \
        liblldb-dev libllvm-ocaml-dev libomp-dev libomp5 lld lldb llvm-dev \
        llvm-runtime llvm python3-clang && \
    apt-get install -y default-jdk && \
    apt-get install -y nodejs npm && \
    apt-get install -y golang && \
    apt-get install -y python3 python3-pip && \
    apt-get install -y cmake htop man-db nano tmux vim wget && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /root
