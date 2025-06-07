# Use a Python image with uv pre-installed
FROM debian:trixie-slim

# Enable bytecode compilation
ENV UV_COMPILE_BYTECODE=1

RUN apt update && apt install -y --no-install-recommends \
    libstdc++6 \
    libc6 \
    git \
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

RUN curl -LsSf https://astral.sh/uv/install.sh | sh \
    && mv /root/.local/bin/uv /usr/local/bin/

# Install GitHub CLI (gh) from .deb package
# 1. Fetch the latest release version programmatically (optional, but good for staying updated)
# 2. Construct the URL for the .deb package
# 3. Download the .deb package
# 4. Install it using dpkg
# 5. Clean up downloaded files
RUN GH_CLI_VERSION=$(curl -s "https://api.github.com/repos/cli/cli/releases/latest" | grep -Po '"tag_name": "v\K[^"]*') \
    && curl -LO "https://github.com/cli/cli/releases/download/v${GH_CLI_VERSION}/gh_${GH_CLI_VERSION}_linux_amd64.deb" \
    && dpkg -i gh_${GH_CLI_VERSION}_linux_amd64.deb \
    && rm gh_${GH_CLI_VERSION}_linux_amd64.deb

ENTRYPOINT ["/bin/sh", "-c", "python3 -V && uv -V && twine --version && convco --version && gh --version && echo 'Ready to use!'"]

