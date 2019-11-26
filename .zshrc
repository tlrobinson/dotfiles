source ~/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh)

antigen bundle git
antigen bundle git-extras
antigen bundle git-flow

antigen bundle docker
antigen bundle heroku
antigen bundle lein

antigen bundle command-not-found
antigen bundle ssh-agent
antigen bundle autojump
antigen bundle common-aliases
antigen bundle compleat
antigen bundle web-search
antigen bundle z

# node
antigen bundle node
antigen bundle npm
export NVM_LAZY_LOAD=true
antigen bundle lukechilds/zsh-nvm
antigen bundle Sparragus/zsh-auto-nvm-use

# python
antigen bundle pip
antigen bundle python
antigen bundle virtualenv

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search ./zsh-history-substring-search.zsh

# OS specific plugins
if [[ $CURRENT_OS == 'OS X' ]]; then
  antigen bundle brew
  antigen bundle brew-cask
  antigen bundle gem
  antigen bundle osx
elif [[ $CURRENT_OS == 'Linux' ]]; then
  # None so far...
elif [[ $CURRENT_OS == 'Cygwin' ]]; then
  antigen bundle cygwin
fi

# Load the theme.
antigen theme robbyrussell

# Tell antigen that you're done.
antigen apply

# PATH
[ -d "/usr/local/sbin" ] && export PATH="/usr/local/sbin:$PATH"

# iTerm
[ -s "$HOME/.iterm2_shell_integration.zsh" ] && source "$HOME/.iterm2_shell_integration.zsh"

# ZSH autosuggestions
[ -s "/usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh" ] && source "/usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh"

# NVM
export NVM_DIR="$(realpath $HOME/.nvm)"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ALIASES AND FUNCTIONS

alias m="cd ~/metabase/metabase"
alias mm="~/metabase/metabase-branch/metabase-branch"

alias httpserver="sudo python -m SimpleHTTPServer 80"
alias smtpserver="sudo python -m smtpd -n -c DebuggingServer localhost:25"
alias nmap++="sudo nmap -sS -sU -T4 -A -v -PE -PP -PS80,443 -PA3389 -PU40125 -PY -g 53 -script 'default or (discovery and safe)'"

alias esphome-docker="docker run --rm -v "${PWD}":/config -it esphome/esphome"

ubuntu() {
  docker build -t ubuntu-tlrobinson - << EOF
FROM ubuntu
RUN apt-get update
RUN apt-get install -y git zsh
WORKDIR /root
RUN git init
RUN git remote add origin https://github.com/tlrobinson/dotfiles.git
RUN git pull origin master
RUN /bin/zsh
ENTRYPOINT ["/bin/zsh"]
EOF
  docker run --rm -it ubuntu-tlrobinson
}
