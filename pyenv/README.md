---
title: pyenv
homepage: https://github.com/pyenv/pyenv
tagline: |
  pyenv: Simple Python Version Management
---

To update run `pyenv update`.

### How to Install pyenv on macOS

Install Xcode tools first:

```sh
xcode-select --install
```

### How to Install pyenv on Linux

Make sure that you already have the necessary build tools installed:

```sh
# required
sudo apt update
sudo apt install -y build-essential zlib1g-dev libssl-dev \
                    libreadline-dev liblzma-dev

# recommended
sudo apt install -y libsqlite3-dev libffi-dev libbz2-dev
```

### How to Install pyenv on Alpine

```sh
sudo apk add \
    bash \
    build-base \
    git \
    zlib-dev
```

## Cheat Sheet

> `pyenv` lets you install and switch between different versions of `python` as
> the logged in user. It doesn't require admin permissions, and doesn't
> interfere with your system version of python.

Be sure to **follow the onscreen instructions** after the install (and the
pre-requisites above).

Here's how you can check for the latest version:

```sh
pyenv install --list | grep -E '^\s+[0-9.]+$' | tail -n 1
#>   3.10.7
```

And install it:

```sh
pyenv install -v 3.10.7
#> Installed Python-3.10.7 to ~/.pyenv/versions/3.10.7
```

And use it:

```sh
pyenv global 3.10.7
python --version
#> Python 3.10.7
```

Revert back to your system python:

```sh
pyenv global system
```

## Table of Contents

- Files
- List Installable Versions
- Install a Specific Version
- Install Local to a Project
- `virtualenv`s
  - List Existing
  - Create New
  - Activate / Deactivate
  - Delete

### Files

These are the files / directories that are created and/or modified with this
install:

```sh
~/.config/envman/PATH.env
~/.pyenv/bin/
~/.pyenv/shims/

# pyenv also loads shell hooks via
~/.bashrc
~/.config/fish/config.fish
~/.zshrc
```

### List all available python version

```sh
pyenv install --list
```

```text
  3.10.7
  activepython-3.6.0
  anaconda3-2020.11
  graalpython-20.3.0
  ironpython-2.7.7
  jython-2.7.2
  micropython-1.13
  miniforge3-4.9.2
  pypy3.7-7.3.3
  pyston-0.6.1
  stackless-3.7.5
```

### Install Python versions

```sh
pyenv install <version>
pyenv rehash
```

### pyenv versions

List installed versions:

```sh
pyenv versions
```

### pyenv local

Pin an application to a specific Python version:

```sh
pyenv local 2.7.6
```

Unset the local version:

```sh
pyenv local --unset
```

(setting the version works per-folder)

### List existing virtualenvs

```sh
pyenv virtualenvs
```

### Create virtualenv

From current version with name "venv35":

```sh
pyenv virtualenv venv35
```

From version 2.7.10 with name "venv27":

```sh
pyenv virtualenv 2.7.10
venv27
```

### Activate/deactivate

```sh
pyenv activate <name>
pyenv deactivate
```

### Delete existing virtualenv

```sh
pyenv uninstall venv27
```
