FROM fedora:latest

RUN dnf group install -y server-product-environment && \
    dnf clean all
RUN dnf group install -y development-tools && \
    dnf group install -y c-development && \
    dnf install -y git && \
    dnf install -y clang clang-tools-extra && \
    dnf install -y java-latest-openjdk-devel && \
    dnf install -y nodejs npm && \
    dnf install -y golang && \
    dnf install -y python3 python3-pip && \
    dnf install -y cmake htop man-db nano tmux vim wget && \
    dnf clean all
