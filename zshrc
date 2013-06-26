# Skip all this for non-interactive shells
[[ -z "$PS1" ]] && return

# Prompt
export PS1=$'%{\e[0;37m%}%B%*%b %{\e[0;35m%}%m:%{\e[0;37m%}%~ %(!.#.$) %{\e[00m%}'

# History
export HISTIGNORE="&:ls:[bf]g:exit:reset:clear:cd:cd ..:cd.."
export HISTSIZE=25000
export HISTFILE=~/.zsh_history
export SAVEHIST=10000
setopt INC_APPEND_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# Say how long a command took, if it took more than 30 seconds
export REPORTTIME=30

# Prompts for confirmation after 'rm *' etc
# Helps avoid mistakes like 'rm * o' when 'rm *.o' was intended
setopt RM_STAR_WAIT

# Don’t write over existing files with >, use >! instead
setopt NOCLOBBER

# Watch other user login/out
watch=notme
export LOGCHECK=60

# Enable color support of ls
if [[ "$TERM" != "dumb" ]]; then
    if [[ -x `which dircolors` ]]; then
	eval `dircolors -b`
	alias 'ls=ls --color=auto'
    fi
fi

# Play safe!
alias 'rm=rm -i'
alias 'mv=mv -i'
alias 'cp=cp -i'


# Short command aliases

# Graphical programs
alias 'gedit=z gedit'
alias -g 'xclip=xclip -se c'

# Git
alias 'm=z meld .'
alias 's=git status'

# Tcc
alias 'wb=cd ~/dev/weatherbill'
alias 'puppet=cd ~/dev/wb-puppet'

# Automatically background processes (no output to terminal etc)
z () {
    $* >>! /tmp/zshrc_z.log 2>&1 &
}

# Path
export PATH=${PATH}:~/dev/Scripts

# Keychain
if [ "$(which keychain)" != '' ]; then
    if [ "${1:-false}" '==' 'keychain' ]; then
        keychain --nogui ~/.ssh/id_rsa
        . ~/.keychain/$(hostname)-sh
    else
        keychain --noask --quiet ~/.ssh/id_rsa
        . ~/.keychain/$(hostname)-sh
    fi
fi

# tcc
export PATH=~/dev/weatherbill/tools:$PATH
export WB_ROOT=~/dev

# Go
export GOROOT=$HOME/go
export PATH=$PATH:$GOROOT/bin
