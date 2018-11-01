# USEFUL BASH ALIASES AND COMMONLY USED COMMANDS
# FIRST MAKE SURE TO ADD THE FOLLOWING TEST TO THE BOTTOM OF YOUR ~/.bashrc FILE
# REMOVE THE COMMENT MARKS WHEN ADDING
#
# START OF TEST
# if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
# fi
# END OF TEST

# PRESERVE FILE DATE AND TIMES WHEN USING SECURE COPY
alias scp="scp -p"

# RESTART SSH ON UBUNTU/PI
alias restartssh="sudo systemctl restart sshd"

# EJECT CD/DVD ON MACOS
alias eject='drutil tray eject'

# LOCK MACOS FROM THE TERMINAL
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# PING SWEEP FOR A DEVICE ON A 192.168.1.XXX
alias sweep="for i in {1..254}; do ping -c 1 -W 1 192.168.1.180 | grep 'from'; done"

# LIST CURRENT OPEN PORTS AND CONNECTIONS
alias tcpports="lsof | grep -i tcp"
alias udpports="lsof | grep -i tcp"

# CENTOS/REDHAT/UBUNTU VERSION
alias version_RHEL1="hostnamectl"
alias version_RHEL2="uname -or"
alias version_RHEL3="uname -a"
alias version_debian="lsb_release -a"
