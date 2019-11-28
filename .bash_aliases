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
alias restartssh_lux="sudo systemctl restart sshd"
# RESTART SSH ON MAC OS
alias restartssh_mac="sudo launchctl stop com.openssh.sshd && sudo launchctl start com.openssh.sshd"

# EJECT CD/DVD ON MACOS
alias eject='drutil tray eject'

# LOCK MACOS FROM THE TERMINAL
alias lock="/System/Library/CoreServices/Menu\ Extras/User.menu/Contents/Resources/CGSession -suspend"

# PING SWEEP FOR A DEVICE ON A 192.168.1.XXX
alias sweep="for i in {1..254}; do ping -c 1 -W 1 192.168.1.$i | grep 'from'; done"

# LIST CURRENT OPEN PORTS AND CONNECTIONS
alias tcpports="lsof | grep -i tcp"
alias udpports="lsof | grep -i udp"

# LIST DEVICES ON MAC OS
alias devices="diskutil list"

# SSH Key fingerpint
# Usage: fingerprint ~/.ssh/key_file
function fingerprint() { ssh-keygen -lf $1 -E md5; }
=======
# CENTOS/REDHAT/UBUNTU VERSION
alias version_RHEL1="hostnamectl"
alias version_RHEL2="uname -or"
alias version_RHEL3="uname -a"
alias version_debian="lsb_release -a"

# DIRECTORY SHORTCUTS
alias cdgithub="cd $HOME/Documents/GitHub"

# COPY TO CLIPBOARD
alias clip="pbcopy < $1"

# SSH-KEYGEN
alias ssh-keygen="ssh-keygen -t rsa -b 4096"

#BASH INTO SPECIFIC DOCKER CONTAINER
alias dockerssh='docker exec -it $1 /bin/bash'

#CONVERT FILE FROM MULTIPLE LINES INTO ONE LINE
alias paste="paste -s -d '\0' $1"
