FROM fedora:latest

RUN sed -i '/^tsflags=.*$/d' /etc/dnf/dnf.conf && \
    dnf upgrade -y && \
    dnf install -y \
        @server-product-environment \
        man-db man-pages \
        @development-tools \
        @c-development \
        git \
        clang clang-devel clang-libs clang-tools-extra libcxx libcxx-devel \
        libcxx-static libcxxabi libcxxabi-devel libcxxabi-static libomp \
        libomp-devel lld lldb lldb-devel llvm llvm-devel llvm-libs \
        llvm-static python3-clang \
        cmake gdb \
        cargo clippy rust rustfmt rust-gdb \
        java-latest-openjdk-devel \
        golang \
        nodejs npm \
        python3 python3-pip \
        bind-utils iputils net-tools traceroute \
        curl gnupg htop nano tmux vim wget && \
    dnf autoremove -y && \
    dnf clean all

WORKDIR /root
