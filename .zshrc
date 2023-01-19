# @see(https://unix.stackexchange.com/questions/339954/zsh-command-not-found-compinstall-compinit-compdef)
autoload -Uz compinit
compinit
# onepassword cl typeahead
eval "$(op completion zsh)"; compdef _op op
export RFI_VAULT_PASSWORD="op://Deploys - Non Production/vault.rest/password"
export RFI_VAULT_PASSWORD_PRODUCTION="op://Deploys/vault.production/password"
export RFI_VAULT_PASSWORD_SANDBOX="op://Deploys - Non Production/vault.sandbox/password"
export RFI_VAULT_PASSWORD_STAGING="op://Deploys - Non Production/vault.staging/password"
export RFI_VAULT_PASSWORD_DEV="op://Deploys - Non Production/vault.dev/password"

source ~/.git-prompt.sh
autoload -U colors && colors
if [[ -n ${TERM} && ! "${TERM}" == 'dumb' && ! "$TERM" == 'unknown' ]]; then
    export CRST="$(tput sgr0)"
    export BOLD="$(tput bold)"
    export LRED="$(tput setaf 1)"
    export LGRN="$(tput setaf 2)"
    export LYEL="$(tput setaf 3)"
    export LBLU="$(tput setaf 4)"
    export LMAG="$(tput setaf 5)"
    export LCYA="$(tput setaf 6)"
    export LWHT="$(tput setaf 7)"
fi

# Local settings
export LANG="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_PAPER="en_US.UTF-8"
export LC_NAME="en_US.UTF-8"
export LC_ADDRESS="en_US.UTF-8"
export LC_TELEPHONE="en_US.UTF-8"
export LC_MEASUREMENT="en_US.UTF-8"
export LC_IDENTIFICATION="en_US.UTF-8"

# Common command options
export LS_OPTIONS='-h -G'
export LSCOLORS='Exfxbxdxcxegedabagacad'
export EDITOR="vim"
export CLICOLOR=1
export LESS=' -R '

# Ensure we have emacs keybindings (^a, ^e for line nav) -- without, vscode terminal fails
bindkey -e;

setopt PROMPT_SUBST;
export GIT_PS1_SHOWDIRTYSTATE=true;
export GIT_PS1_SHOWUNTRACKEDFILES=true;
export GIT_PS1_SHOWCOLORHINTS=true;
# separator defaults to " " -- removes it completely.
export GIT_PS1_STATESEPARATOR="";
precmd () { __git_ps1 "$fg[yellow] [$reset_color$fg[magenta]%n$reset_color$fg[yellow]:$reset_color$BOLD$fg[blue]%c$reset_color$fg[yellow]]" "$fg[yellow]$BOLD> $reset_color" " $fg[cyan]($reset_color%s$fg[cyan])$reset_color" }

autoload -Uz compinit && compinit

function openpr() {
  github_url=`git remote -v | awk '/fetch/{print $2}' | sed -Ee 's#(git@|git://)#https://#' -e 's@com:@com/@' -e 's%\.git$%%' | awk '/github/'`;
  branch_name=`git symbolic-ref HEAD | cut -d"/" -f 3,4`;
  if [ -n "$1" ]
  then
      source_branch="$1"
  else
      source_branch=$( [[ $(git branch | grep main) =~ "main" ]] && echo "main" || echo "master");
  fi;
  pr_url=$github_url"/compare/$source_branch...$branch_name";
  open $pr_url;
}

eval "$(/opt/homebrew/bin/brew shellenv)"
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
# Prefer the gnu tools installed via 
export PATH="/opt/homebrew/opt/findutils/libexec/gnubin:$PATH"
export GOOGLE_APPLICATION_CREDENTIALS="${HOME}/.config/gcloud/application_default_credentials.json"