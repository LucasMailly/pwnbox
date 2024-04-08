# pwn-Docker-Toolbox

This is a Docker container that contains all the tools needed for binary exploitation and reverse engineering.

# Build

```bash
docker build -t pwntoolbox .
```

# Usage

```bash
docker run -it --rm -v .:/root --cap-add=SYS_PTRACE --security-opt seccomp=unconfined pwntoolbox
```