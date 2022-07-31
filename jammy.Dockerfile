FROM ubuntu:jammy

RUN apt-get update && \
    yes | unminimize && \
    apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
        ubuntu-server \
        man-db manpages manpages-dev \
        build-essential \
        git \
        clang-format clang-tidy clang-tools clang clangd libc++-dev libc++1 \
        libc++abi-dev libc++abi1 libclang-dev libclang1 liblldb-dev \
        libllvm-ocaml-dev libomp-dev libomp5 lld lldb llvm-dev llvm-runtime \
        llvm python3-clang \
        cmake gdb \
        rust-all \
        default-jdk \
        golang \
        nodejs npm \
        python3 python3-pip \
        dnsutils iputils-ping iputils-tracepath net-tools traceroute \
        curl gnupg htop nano tmux vim wget && \
    apt-get autoremove -y && \
    apt-get clean

WORKDIR /root
