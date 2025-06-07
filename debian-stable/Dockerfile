#
# Problem: 
# Debian bookworm (Debian GLIBC 2.36-9+deb12u10) 2.36
# convco: /lib/x86_64-linux-gnu/libc.so.6: version `GLIBC_2.39' not found (required by convco)

# Use a Python image with uv pre-installed
FROM ghcr.io/astral-sh/uv:python3.13-bookworm-slim

# Enable bytecode compilation
ENV UV_COMPILE_BYTECODE=1

RUN apt update && apt install -y --no-install-recommends \
    curl \
    unzip \
    twine \
    python3-hatchling \
    # Clean up apt cache
    && rm -rf /var/lib/apt/lists/*

RUN curl -OL https://github.com/convco/convco/releases/latest/download/convco-deb.zip \
    && unzip convco-deb.zip \
    && dpkg -i convco*.deb \
    && rm convco*.deb convco-deb.zip

ENTRYPOINT ["/bin/sh", "-c", "python -V && uv -V && twine --version && convco --version && echo 'Ready to use!'"]

