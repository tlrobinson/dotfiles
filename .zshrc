source ~/.antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
# antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme robbyrussell

# Tell antigen that you're done.
antigen apply

alias m="cd ~/metabase/metabase"
alias mm="~/metabase/metabase-branch/metabase-branch"

alias httpserver="sudo python -m SimpleHTTPServer 80"
alias smtpserver="sudo python -m smtpd -n -c DebuggingServer localhost:25"
alias nmap++="sudo nmap -sS -sU -T4 -A -v -PE -PP -PS80,443 -PA3389 -PU40125 -PY -g 53 -script 'default or (discovery and safe)'"

alpine() {
  docker build -t alpine-tlrobinson - << EOF
FROM alpine
RUN apk add git zsh
WORKDIR /root
RUN git init
RUN git remote add origin https://github.com/tlrobinson/dotfiles.git
RUN git pull origin master
RUN /bin/zsh
ENTRYPOINT ["/bin/zsh"]
EOF
  docker run --rm -it alpine-tlrobinson
}

[ -d "/usr/local/sbin" ] && export PATH="/usr/local/sbin:$PATH"

# iTerm
[ -s "$HOME/.iterm2_shell_integration.zsh" ] && source "$HOME/.iterm2_shell_integration.zsh"

# NVM
export NVM_DIR="$HOME/.nvm"
if [ -d "$NVM_DIR" ]; then
  source "$NVM_DIR/nvm.sh"  # This loads nvm
  source "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fi

# end dotfiles .zshrc