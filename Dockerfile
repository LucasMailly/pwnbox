FROM ubuntu:latest

RUN dpkg --add-architecture i386

RUN apt-get update && apt-get install -y \
    curl \
    file \
    gdb-multiarch \
    git \
    liblzma-dev \
    libssl-dev \
    libc6:i386 \
    libncurses5:i386 \
    libstdc++6:i386 \
    python3 \
    python3-pip \
    pkg-config \
    ruby \
    unzip \
    wget \
    && rm -rf /var/lib/apt/lists/*

# Rust and Cargo
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

# # latest release of Ghidra from GitHub
# RUN wget https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_11.0.2_build/ghidra_11.0.2_PUBLIC_20240326.zip -O ghidra.zip
# RUN unzip ghidra.zip
# RUN rm ghidra.zip

# pwntools
RUN pip3 install pwntools

# pwninit
RUN cargo install pwninit

# gdb-gef
RUN bash -c "$(curl -fsSL https://gef.blah.cat/sh)"

# one-gadget
RUN gem install one_gadget

# add function pwncheck
RUN echo 'function pwncheck() {\n\
    file "$1"\n\
    checksec "$1"\n\
    if [ $# -eq 2 ]\n\
            then\n\
                binary-security-check "$1" -l "$2"\n\
        else\n\
            binary-security-check "$1"\n\
    fi\n\
}' >> /etc/bash.bashrc 

WORKDIR /pwn

EXPOSE 22

CMD ["/bin/bash"]