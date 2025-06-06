# Use a Python image with uv pre-installed
FROM ghcr.io/astral-sh/uv:python3.13-bookworm-slim

# Enable bytecode compilation
ENV UV_COMPILE_BYTECODE=1

RUN apt update && apt install -y \
    twine \
    python3-hatchling \
    # Clean up apt cache
    && rm -rf /var/lib/apt/lists/*

# Reset the entrypoint, don't invoke `uv`
ENTRYPOINT ["/bin/sh", "-c", "python -V && uv -V && twine --version"]

