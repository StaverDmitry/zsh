# Initial configuration
  ZSH=/Users/neyr/.oh-my-zsh

  source $ZSH/oh-my-zsh.sh
  source $(brew --prefix)/share/antigen/antigen.zsh
	source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Antigen
  antigen use oh-my-zsh
  antigen bundle zsh-users/zsh-syntax-highlighting
  antigen theme 'robbyrussell'
  antigen apply

# Zsh config
  KEYTIMEOUT=1
  COMPLETION_WAITING_DOTS="true"
  HIST_STAMPS="dd/mm/yyyy"
  COMPLETION_WAITING_DOTS="true"

  plugins=(git)

# Aliases
  alias vim="nvim"
  alias chrome="/usr/bin/open -a '/Applications/Google Chrome.app'"

  # GIT START
    alias go="git checkout"
    alias gob="git checkout -b"
    alias gs="git status"
    alias gc="git commit -m"
    alias ga="git add"
    alias gca="git commit -a -m" 
    alias amend="git commit --amend"
    alias gcurrent="git rev-parse --abbrev-ref HEAD"
    alias gmerged="git branch --merged"
    alias gnmerged="git branch --no-merged"
    alias glog="git log --decorate --stat --graph --pretty=format:'%d %Cgreen%h%Creset (%ar - %Cred%an%Creset), %s%n'"
    alias first_commit='git log master..$(gcurrent) --oneline | tail -1'
    alias redis="redis-cli"
    alias merged='for branch in `git branch -r --merged | grep -v HEAD`; do echo -e `git show --format="%ci %cr %an" $branch | head -n 1` \\t$branch; done | sort -r'
    alias no-merged='for branch in `git branch -r --no-merged | grep -v HEAD`; do echo -e `git show --format="%ci %cr %an" $branch | head -n 1` \\t$branch; done | sort -r'

    pushall() {
      if [ $# -ne 0 ]; then
        git add .
        git commit -m "$*"
      fi
      git push origin $(gcurrent)
    }

    function pushc() { git push origin $(gcurrent) }
    function pullc() { git pull origin $(gcurrent) }
  # GIT END

  # Safe move copy
    alias cp="cp -i"
    alias mv="mv -i"

  # Rspec
    alias rtest="bundle exec rspec -fd"

  # Copy
    function copy() { echo "$@" | xsel -bi }


# Env variables
  if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
  else
    export EDITOR='vim'
  fi
  export VISUAL=vim
  export ANTIGEN_LOG=/path/to/antigen.log
  export BROWSER=google-chrome

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
  export PATH="$PATH:$HOME/.rvm/bin"

# Shell integration
  test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
  source /Users/neyr/.iterm2_shell_integration.zsh


