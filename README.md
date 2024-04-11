# pwnbox

A Docker container equipped with essential tools for binary exploitation and reverse engineering tasks.

# Prerequisites
You need to have [Docker](https://docs.docker.com/get-docker/) installed on your machine to run the container.

# Build

```bash
docker build -t pwnbox .
```

# Installation

You can pull the image from Docker Hub.
```bash
docker pull lmailly/pwnbox:latest
```

### Linux

You can add an alias to your `.bashrc` or `.zshrc` file to make it easier to run the container.
```bash
alias pwnbox='docker run -it --rm -v .:/root --cap-add=SYS_PTRACE --security-opt seccomp=unconfined lmailly/pwnbox:latest'
```

### Windows

You can run the `install.ps1` script to create an alias for the container.
```powershell
powershell -ExecutionPolicy Bypass -File .\install.ps1
```

# Usage

You can run the container with the following command. All the files in the current directory will be mounted to the `/root` directory in the container.

```bash
docker run -it --rm -v .:/root --cap-add=SYS_PTRACE --security-opt seccomp=unconfined pwnbox

# or with the alias
pwnbox
```