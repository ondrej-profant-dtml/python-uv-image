# Python via uv Image

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![Python 3.13+](https://img.shields.io/badge/python-3.13+-blue.svg)](https://www.python.org/downloads/release/python-3130/)
[![uv](https://img.shields.io/badge/built%20with-uv-blueviolet)](https://astral.sh/blog/uv)

A minimal, OCI-compatible (Docker/Podman) container image for modern Python development.

## Features

- **Python 3.13** (from [astral-sh/uv](https://github.com/astral-sh/uv))
- **uv**: Fast Python package manager and build backend
- **hatchling**: Modern Python project build system
- **twine**: Utility for publishing Python packages

## Usage

### Pull from GHCR

```sh
podman pull ghcr.io/ondrej-profant-dtml/python-uv-image:latest
# or
docker pull ghcr.io/ondrej-profant-dtml/python-uv-image:latest
```

Build the image:

```sh
podman build -t python-uv .
# or
docker build -t python-uv .
```

Run the image and check tool versions:

```sh
podman run --rm python-uv
# or
docker run --rm python-uv
```

### Push to GHCR

```sh
podman login ghcr.io --username ondrej-profant-dtml --password <token>
podman build -t ghcr.io/ondrej-profant-dtml/python-uv-image:latest .
podman push ghcr.io/ondrej-profant-dtml/python-uv-image:latest
```


## Purpose

The main goal is to provide a modern Python environment with fast dependency management and publishing tools, suitable for CI/CD pipelines or local development.

Inspired by [astral-sh/uv-docker-example](https://github.com/astral-sh/uv-docker-example/tree/main).

**License:** MIT

