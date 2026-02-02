# -------- Base --------
FROM python:3.12-slim

ENV DEBIAN_FRONTEND=noninteractive
ENV PYTHONUNBUFFERED=1
ENV PIP_NO_CACHE_DIR=1
ENV PLAYWRIGHT_BROWSERS_PATH=/ms-playwright

# -------- System deps --------
RUN apt-get update && apt-get install -y --no-install-recommends \
    ca-certificates \
    curl \
    wget \
    git \
    gnupg \
    unzip \
    build-essential \
    sudo \
    jq \
    nano \
    vim \
    tmux \
    zsh \
    xauth \
    xvfb \
    libnss3 \
    libatk-bridge2.0-0 \
    libgtk-3-0 \
    libxss1 \
    libasound2 \
    libdrm2 \
    libgbm1 \
    libxshmfence1 \
    fonts-liberation \
    pre-commit \
    docker-cli \
    docker-compose \
    openssh-client \
 && rm -rf /var/lib/apt/lists/*

# -------- Node.js (LTS) --------
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
 && apt-get install -y nodejs \
 && npm install -g npm@latest

# -------- Python tooling --------
RUN pip install --upgrade pip setuptools wheel \
 && pip install \
    playwright \
    ipython \
    poetry \
    pipx

# -------- Playwright browsers --------
RUN playwright install chromium firefox

# -------- OpenCode --------
RUN npm install -g opencode-ai

# -------- Non-root user --------
ARG USERNAME=dev
ARG UID=1000
ARG GID=1000

RUN groupadd --gid $GID $USERNAME \
 && useradd --uid $UID --gid $GID -m -s /bin/zsh $USERNAME \
 && echo "$USERNAME ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/$USERNAME

USER $USERNAME
WORKDIR /workspace

# -------- Default --------
CMD ["zsh"]
