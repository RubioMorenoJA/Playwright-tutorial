#!/usr/bin/env sh

set -e

# Opencode config
if [ ! -d "$HOME/.config/opencode" ]; then
    echo "▶ Creating ...$HOME/.config/opencode"
    mkdir -p "$HOME/.config/opencode"
fi
cp .devcontainer/opencode-config.yaml "/workspace/.opencode.yaml"
cp .devcontainer/opencode-config.yaml "$HOME/.config/opencode/config.yaml"
cp .devcontainer/opencode-rules.md "/workspace/.opencode-rules.md"

# By the moment we will use initial continue configuration
# if [ ! -d "$HOME/.continue" ]; then
    # echo "▶ Creating ...$HOME/.continue"
    # mkdir -p "$HOME/.continue"
# fi
# cp .devcontainer/continue-config.yaml "$HOME/.continue/config.yaml"

if [ ! -d "$HOME/.oh-my-zsh" ]; then 
    echo "▶ Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended; 
fi

# Zsh config
if [ -f ".devcontainer/.zshrc" ]; then
  echo "▶ Installing .zshrc"
  cp .devcontainer/.zshrc "$HOME/.zshrc"
fi

# pre-commit (solo si existe)
if command -v pre-commit >/dev/null 2>&1; then
  echo "▶ Installing pre-commit hooks"
  pre-commit install
else
  echo "⚠ pre-commit not installed, skipping"
fi

echo "▶ Installing Python project dependencies from pyproject.toml..."
pip install --upgrade pip
pip install -e .

echo "▶ Ensuring Playwright browsers are ready..."
playwright install chromium firefox

echo "✔ postCreateCommand finished"