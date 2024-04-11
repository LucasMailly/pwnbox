$dest = "$env:APPDATA\pwnbox"
if (Test-Path $dest) {
    Remove-Item $dest -Recurse
}
New-Item -ItemType Directory -Path $dest | Out-Null

# $githubRepo = "https://raw.githubusercontent.com/LucasMailly/pwnbox/main/"
# $files = @("Dockerfile", "pwnbox.bat")
# foreach ($file in $files) {
#     try {
#         Invoke-WebRequest -Uri ($githubRepo + $file) -OutFile ($dest + "\" + $file)
#     }
#     catch {
#         Write-Host "An error occured while downloading $file" -ForegroundColor Red
#         exit 1
#     }
# }

@"
@echo off
docker run -it --rm -v %cd%:/root --cap-add=SYS_PTRACE --security-opt seccomp=unconfined lmailly/pwnbox:latest
"@ | Out-File -FilePath "$dest\pwnbox.bat" -Encoding ascii

if (-not ($env:Path -like "*$dest*")) {
    $env:Path += ";$dest"
    [Environment]::SetEnvironmentVariable("Path", $env:Path, [System.EnvironmentVariableTarget]::User)
}

Write-Host "pwnbox installed successfully. 
Please restart your terminal or open a new one to use it." -ForegroundColor Green