#!/usr/local/bin/zsh
local ret_status="%(?:%{$fg[green]%}➜ :%{$fg[red]%}➜ ) %{$fg[black]%}%{$bg[blue]%}"

local color1="%{$fg[black]%}%{$bg[blue]%}"
local color2="%{$fg[blue]%}%{$bg[yellow]%}"
local color3="%{$fg[black]%}%{$bg[yellow]%}"
local color4="%{$fg[yellow]%}%{$bg[black]%}"

# Modified from lib/git.zsh
function git_short_prompt_info() {
  local ref
  if [[ "$(command git config --get oh-my-zsh.hide-status 2>/dev/null)" != "1" ]]; then
    ref=$(command git symbolic-ref HEAD 2> /dev/null) || \
    ref=$(command git rev-parse --short HEAD 2> /dev/null) || return 0
    local branch="${ref#refs/heads/}"
    if [[ ${#branch} > 20 ]]; then
      echo "$ZSH_THEME_GIT_PROMPT_PREFIX${branch[0,20]}…$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
    else
      echo "$ZSH_THEME_GIT_PROMPT_PREFIX${branch}$(parse_git_dirty)$ZSH_THEME_GIT_PROMPT_SUFFIX"
    fi
  fi
}

PROMPT='${ret_status} ${color1}%c ${color2}${color3} $(git_short_prompt_info)${color4}%{$reset_color%} '

ZSH_THEME_GIT_PROMPT_PREFIX=" "
ZSH_THEME_GIT_PROMPT_SUFFIX=" "
ZSH_THEME_GIT_PROMPT_DIRTY=" ●"
ZSH_THEME_GIT_PROMPT_CLEAN=""
