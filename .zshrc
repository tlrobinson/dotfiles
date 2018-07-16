# source $HOME/.dotfiles/antigen/antigen.zsh

config_files=($HOME/.dotfiles/**/*.zsh)

# load the path files
for file in ${config_files}
do
  source $file
done

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

alias config='/usr/bin/git --git-dir=$HOME/.dotfiles.git/ --work-tree=$HOME'

alias m="cd ~/metabase/metabase"
alias mm="~/metabase/metabase-branches/start-branch"
alias smtpserver="sudo python -m smtpd -n -c DebuggingServer localhost:25"

alias mac_iphone="sudo ifconfig en0 ether 70:70:0D:00:D3:B5"

export PATH="/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

test -e "${HOME}/.zshrc.credentials.zsh" && source "${HOME}/.zshrc.credentials.zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
