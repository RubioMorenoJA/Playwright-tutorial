#!/usr/bin/env sh

set -e

# Opencode config
if [ ! -d "$HOME/.config/opencode" ]; then
    echo "▶ Creating ...$HOME/.config/opencode"
    mkdir -p "$HOME/.config/opencode"
fi

cp .devcontainer/opencode.json /workspace/opencode.json
cp .devcontainer/opencode.json "$HOME/.config/opencode/opencode.json"
# cp .devcontainer/opencode-rules.md "/workspace/.opencode-rules.md"

# By the moment we will use initial continue configuration
# Check if yaml are the right files or we need to convert from json to yaml
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

echo "✔ postCreateCommand finished"