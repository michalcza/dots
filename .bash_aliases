# USEFUL BASH ALIASES
# TO BE PLACED IN ~/.bash_aliases FILE
#
#
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# PRESERVE FILE DATE AND TIMES WHEN USING SECURE COPY
alias scp="scp -p"

# RESTART SSH ON UBUNTU/PI
alias restartssh="sudo systemctl restart sshd"

# EJECT CD/DVD ON MACOS
alias eject='drutil tray eject'
