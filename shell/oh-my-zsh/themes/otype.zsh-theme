# vim:ft=zsh ts=2 sw=2 sts=2

# More symbols to choose from:
# ☀ ✹ ☄ ♆ ♀ ♁ ♐ ♇ ♈ ♉ ♚ ♛ ♜ ♝ ♞ ♟ ♠ ♣ ⚢ ⚲ ⚳ ⚴ ⚥ ⚤ ⚦ ⚒ ⚑ ⚐ ♺ ♻ ♼ ☰ ☱ ☲ ☳ ☴ ☵ ☶ ☷
# ✡ ✔ ✖ ✚ ✱ ✤ ✦ ❤ ➜ ➟ ➼ ✂ ✎ ✐ ⨀ ⨁ ⨂ ⨍ ⨎ ⨏ ⨷ ⩚ ⩛ ⩡ ⩱ ⩲ ⩵  ⩶ y⨠
# ⬅ ⬆ ⬇ ⬈ ⬉ ⬊ ⬋ ⬒ ⬓ ⬔ ⬕ ⬖ ⬗ ⬘ ⬙ ⬟  ⬤ 〒 ǀ ǁ ǂ ĭ Ť Ŧ
#
rbenv_version() {
	rbenv version 2>/dev/null | awk '{print $1}'
}

if which rbenv &> /dev/null; then
	rbenv_info='%{$fg_bold[red]%}${$(rbenv_version)/#system/}%{$reset_color%}'
fi

pyenv_version() {
	pyenv version 2>/dev/null | awk '{print $1}'
}

if which pyenv &> /dev/null; then
	pyenv_info='%{$fg_bold[magenta]%}${$(pyenv_version)/#system/}%{$reset_color%}'
fi

goenv_version() {
	goenv version 2>/dev/null | awk '{print $1}'
}

if which goenv &> /dev/null; then
	goenv_info='%{$fg_bold[white]%}${$(goenv_version)/#system/}%{$reset_color%}'
fi

# Must use Powerline font, for \uE0A0 to render.
ZSH_THEME_GIT_PROMPT_PREFIX="on %{$fg[yellow]%}\uE0A0"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%} 👀  "
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[blue]%}❓"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[yellow]%} 👍  "
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[green]%}✳️"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%}⚠️"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%}❌"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%}✏️"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%}⚙️"
ZSH_THEME_GIT_PROMPT_AHEAD="%{$fg[yellow]%}🔆"

local user_host='(%{$fg_bold[green]%}%n@%m%{$reset_color%})'
local current_dir='%{$fg_bold[blue]%}${PWD/#$HOME/~}%{$reset_color%}'
local git_info='$(git_prompt_info)%{$reset_color%}$(git_prompt_status)%{$reset_color%}$(git_prompt_ahead)%{$reset_color%}'

PROMPT="
${user_host} :: ${current_dir} ${git_info} ${rbenv_info} ${pyenv_info} ${goenv_info}
|:. "
