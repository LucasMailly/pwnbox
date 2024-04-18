$dest = "$env:APPDATA\pwnbox"
if (Test-Path $dest) {
    Remove-Item $dest -Recurse
}
New-Item -ItemType Directory -Path $dest | Out-Null

@"
@echo off
docker pull lmailly/pwnbox:latest
docker run -it --rm -v .:/pwn --cap-add=SYS_PTRACE --security-opt seccomp=unconfined --name pwnbox lmailly/pwnbox:latest
"@ | Out-File -FilePath "$dest\pwnbox.bat" -Encoding ascii

if (-not ($env:Path -like "*$dest*")) {
    $env:Path += ";$dest"
    [Environment]::SetEnvironmentVariable("Path", $env:Path, [System.EnvironmentVariableTarget]::User)
}

Write-Host "pwnbox installed successfully. 
Please restart your terminal or open a new one to use it." -ForegroundColor Green