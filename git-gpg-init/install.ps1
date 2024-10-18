#!/bin/pwsh

Write-Output "'git-gpg-init@$Env:WEBI_TAG' is an alias for 'git-config-gpg@$Env:WEBI_VERSION'"
IF ($null -eq $Env:WEBI_HOST -or $Env:WEBI_HOST -eq "") { $Env:WEBI_HOST = "https://webinstall.dev" }
curl.exe -A MS -fsSL "$Env:WEBI_HOST/git-config-gpg@$Env:WEBI_VERSION" | powershell
