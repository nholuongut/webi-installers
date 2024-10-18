#!/usr/bin/env pwsh

IF (!(Test-Path -Path "$Env:USERPROFILE\.vim\pack\plugins\start")) {
    New-Item -Path "$Env:USERPROFILE\.vim\pack\plugins\start" -ItemType Directory -Force | Out-Null
}
Remove-Item -Path "$Env:USERPROFILE\.vim\pack\plugins\start\vim-airline-themes" -Recurse -ErrorAction Ignore
& git clone --depth=1 https://github.com/vim-airline/vim-airline-themes.git "$Env:USERPROFILE\.vim\pack\plugins\start\vim-airline-themes"
