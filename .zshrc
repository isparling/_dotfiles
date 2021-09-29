source ~/.git-prompt.sh
autoload -U colors && colors
setopt PROMPT_SUBST;
export GIT_PS1_SHOWDIRTYSTATE=true;
export GIT_PS1_SHOWUNTRACKEDFILES=true;
export GIT_PS1_SHOWCOLORHINTS=true;
# separator defaults to " " -- removes it completely.
export GIT_PS1_STATESEPARATOR="";
precmd () { __git_ps1 "[$fg[green]%n$reset_color$fg[yellow]:$reset_color$fg[blue]%c$reset_color]" "$ " "(%s)" }

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