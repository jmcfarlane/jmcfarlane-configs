# John McFarlane's personal bash preferences
#

# Bash env vars
export HISTCONTROL=ignoredups:ignorespace
export HISTFILESIZE=5000
export HISTSIZE=3000
export PATH="${PATH}:~/dev/Scripts"

# Personal env vars
export DEV=true
export ROCKFLOAT_DEV=true

# Lazy load keychain
if [ "$(which keychain)" != '' ]; then
    if [ "${1:-false}" == 'keychain' ]; then
        keychain --nogui ~/.ssh/id_rsa
        . ~/.keychain/${HOSTNAME}-sh
    else
        keychain --noask --quiet ~/.ssh/id_rsa
        . ~/.keychain/${HOSTNAME}-sh
    fi
fi

# Fix gvim menu support for Natty (this is temporary)
function gvim () { /usr/bin/gvim -f $* & }

# Mpc bash completion
f=/usr/share/doc/mpc/mpc-completion.bash
if [ -f $f ]; then
    . $f
fi
