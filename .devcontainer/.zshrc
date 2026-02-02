# ---- Basics ----
export SHELL=/bin/zsh
export EDITOR=code
export VISUAL=code

# ---- History ----
HISTSIZE=10000
SAVEHIST=10000
setopt share_history
setopt hist_ignore_dups
setopt hist_reduce_blanks

# ---- Prompt (simple y estable) ----
# configure showing git branches on prompt
git_branch() {
  git branch --show-current 2>/dev/null
}
git_branch_prompt() {
  local branch
  branch=$(git_branch)
  if [ -n "$branch" ]; then
    echo " %{$fg[red]%}($branch)%{$reset_color%}"
  fi
}
autoload -Uz colors && colors
PROMPT='%{$fg[cyan]%}%n@%m%{$reset_color%}:%{$fg[yellow]%}%~%{$reset_color%}$(git_branch_prompt)$ '

# ---- Aliases útiles ----
alias ll='ls -lah'
alias gs='git status'
alias gd='git diff'
alias gc='git commit'
alias gp='git pull'
alias python='python3'

# ---- Python ----
export PYTHONDONTWRITEBYTECODE=1
export PYTHONUNBUFFERED=1

# ---- Playwright ----
export PLAYWRIGHT_BROWSERS_PATH=/ms-playwright

# ---- OpenCode ----
alias oc='opencode'
alias oca='opencode ask'
alias oce='opencode explain'
alias ocd='opencode diff'

# ---- Git ----
autoload -Uz vcs_info
precmd() { vcs_info }
setopt prompt_subst

# ---- Completion ----
autoload -Uz compinit && compinit

# ---- Welcome ----
echo "🐳 Dev Container listo | Python $(python --version 2>/dev/null)"
