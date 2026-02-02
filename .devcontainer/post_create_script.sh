#!/usr/bin/env sh

set -e

if [ ! -d "$HOME/.config/opencode" ]; then
    echo "▶ Creating ...$HOME/.config/opencode"
    mkdir -p "$HOME/.config/opencode"
fi
cp .devcontainer/opencode-config.yaml "/workspace/.opencode.yaml"
cp .devcontainer/opencode-config.yaml "$HOME/.config/opencode/config.yaml"

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

echo "✔ postCreateCommand finished"