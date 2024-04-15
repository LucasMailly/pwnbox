# pwnbox

A Docker container equipped with essential tools for binary exploitation and reverse engineering tasks.

# Prerequisites
You need to have [Docker](https://docs.docker.com/get-docker/) installed on your machine to run the container.

# Installation

### Unix

You can add an alias to your `.bashrc` or `.zshrc` file to make it easier to run the container.
```bash
alias pwnbox='docker pull lmailly/pwnbox:latest && docker run -it --rm -v .:/pwn --cap-add=SYS_PTRACE --security-opt seccomp=unconfined lmailly/pwnbox:latest'
```

### Windows

Execute the following command in PowerShell to create an alias for the container.
```powershell
Invoke-Expression (New-Object System.Net.WebClient).DownloadString("https://raw.githubusercontent.com/LucasMailly/pwnbox/main/install.ps1?$(Get-Random)")
```
Or you run the `install.ps1` script manually.
```powershell
powershell -ExecutionPolicy Bypass -File .\install.ps1
```

# Usage

You can run the container with the following command. All the files in the current directory will be mounted to the `/pwn` directory in the container.

```bash
docker run -it --rm -v .:/pwn --cap-add=SYS_PTRACE --security-opt seccomp=unconfined lmailly/pwnbox:latest

# or with the alias
pwnbox
```
