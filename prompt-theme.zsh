# Base: woefe default theme
# https://github.com/woefe/git-prompt.zsh/blob/master/examples/default.zsh

ZSH_GIT_PROMPT_SHOW_UPSTREAM="no"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[yellow](%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[yellow])%}"
ZSH_THEME_GIT_PROMPT_SEPARATOR="%{$fg[yellow]|%}"
ZSH_THEME_GIT_PROMPT_DETACHED="%{$fg_bold[cyan]%}:"
ZSH_THEME_GIT_PROMPT_BRANCH="%{$fg[cyan]%}"
ZSH_THEME_GIT_PROMPT_UPSTREAM_SYMBOL="%{$fg_bold[yellow]%}⟳ "
ZSH_THEME_GIT_PROMPT_UPSTREAM_PREFIX="%{$fg[red]%}(%{$fg[yellow]%}"
ZSH_THEME_GIT_PROMPT_UPSTREAM_SUFFIX="%{$fg[red]%})"
ZSH_THEME_GIT_PROMPT_BEHIND="↓"
ZSH_THEME_GIT_PROMPT_AHEAD="↑"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[red]%}✖"
ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}●"
ZSH_THEME_GIT_PROMPT_UNSTAGED="%{$fg[red]%}✚"
ZSH_THEME_GIT_PROMPT_UNTRACKED="…"
ZSH_THEME_GIT_PROMPT_STASHED="%{$fg[blue]%}⚑"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_bold[green]%}✔"

# USEFUL: https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/
# PROMPT='%B%40<..<' # ???
PROMPT='%{$fg[yellow]%}[' # yellow([)
PROMPT+='%{$fg[magenta]%}%n' # magenta(current_user)
PROMPT+='%{$fg[yellow]%}:' # yellow(:)
PROMPT+='%B%{$fg[blue]%}%2~%b' # bold(blue(last two entries in cwd))
PROMPT+='%{$fg[yellow]%}]' # yellow(])
PROMPT+=' %b$(gitprompt)' # guarantee_unbold, gitprompt

# if last command success:
  # if root: %F{white}❯%F{yellow}❯%F{red}
  # else %F{blue}❯%F{cyan}❯%F{green}
# else %F{red}❯❯❯
PROMPT+='%(?.%(!.%F{white}❯%F{yellow}❯%F{red}.%F{blue}❯%F{cyan}❯%F{green})❯.%F{red}❯❯❯)%f '
RPROMPT=''
