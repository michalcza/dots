#Useful Bash aliases
#Make sure that the following lines are added to or not commented out in ~./bashrc
#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

#Preserve file date and times when using secure copy
alias scp="scp -p"

#restart ssh on Ubuntu/Pi
alias restartssh="sudo systemctl restart sshd"
