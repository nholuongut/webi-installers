#!/usr/bin/env pwsh

##################
# Install dart-sass #
##################

$pkg_cmd_name = "dart-sass"

$pkg_dst_cmd = "$Env:USERPROFILE\.local\opt\dart-sass\sass.bat"
$pkg_dst_dir = "$Env:USERPROFILE\.local\opt\dart-sass"
$pkg_dst = "$pkg_dst"
#$pkg_dst_cmd = "$Env:USERPROFILE\.local\bin\sass.bat"
#$pkg_dst = "$pkg_dst_cmd"

$pkg_src_cmd = "$Env:USERPROFILE\.local\opt\dart-sass-v$Env:WEBI_VERSION\sass.bat"
$pkg_src_bin = "$Env:USERPROFILE\.local\opt\dart-sass-v$Env:WEBI_VERSION"
$pkg_src_dir = "$Env:USERPROFILE\.local\opt\dart-sass-v$Env:WEBI_VERSION"
$pkg_src = "$pkg_src_dir"

New-Item "$Env:USERPROFILE\Downloads\webi" -ItemType Directory -Force | Out-Null
$pkg_download = "$Env:USERPROFILE\Downloads\webi\$Env:WEBI_PKG_FILE"

IF (!(Test-Path -Path "$Env:USERPROFILE\Downloads\webi\$Env:WEBI_PKG_FILE")) {
    Write-Output "Downloading sass (dart-sass) from $Env:WEBI_PKG_URL to $pkg_download"
    & curl.exe -A "$Env:WEBI_UA" -fsSL "$Env:WEBI_PKG_URL" -o "$pkg_download.part"
    & Move-Item "$pkg_download.part" "$pkg_download"
}

IF (!(Test-Path -Path "$pkg_src_cmd")) {
    Write-Output "Installing sass (dart-sass)"

    Push-Location .local\tmp

    # Remove any leftover tmp cruft
    Remove-Item -Path ".\dart-sass-v*" -Recurse -ErrorAction Ignore

    Write-Output "Unpacking $pkg_download"
    & tar xf "$pkg_download"

    Write-Output "Install Location: $pkg_src_cmd"
    New-Item "$pkg_src_bin" -ItemType Directory -Force | Out-Null > $null
    Move-Item -Path ".\dart-sass\*" -Destination "$pkg_src_dir"

    # Exit tmp
    Pop-Location
}

Remove-Item "$pkg_dst_dir" -Force -Confirm:$False -Recurse -ErrorAction Ignore
Write-Output "Linking '$pkg_dst_dir' from '$pkg_src_dir'"
New-Item -ItemType Junction -Path "$pkg_dst_dir" -Target "$pkg_src_dir" > $null

# Add to path
webi_path_add ~/.local/opt/dart-sass
