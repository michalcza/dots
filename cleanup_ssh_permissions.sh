#!/bin/sh

###################################################################
#Script Name    :cleanup_ssh_permissions.sh
#Description    :Cleanup file permissions for SSH keys and folders
#Created        :24 November 2018
#Args           :
#Author         :Michal Czarnecki
#Email          :mczarnecki@gmail.com
#GitHub         :http://www.github.com/michalcza
###################################################################
#To Do          :
###################################################################
#Status         :Development
###################################################################
#
# SOURCE: https://help.ubuntu.com/community/SSH/OpenSSH/Keys
# Set exit code to assume bad exit
exitcode=1
# Declare variables
SSHFOLDER="$HOME/.ssh"
SSHFOLDER_PERM="stat -f %A $SSHFOLDER"
KEYS="$HOME/.ssh/authorized_keys"
HOSTS="$HOME/.ssh/known_hosts"
CONFIG="$HOME/.ssh/config"
KEY_PUB="$HOME/.ssh/$1.pub"
KEY_PRV="$HOME/.ssh/$1"
PERM700="700"
PERM644="644"
PERM600="600"
# DEFINE MAIN FUNCTION
update_permissions (){
# ~/.SSH FOLDER
if [ -d $SSHFOLDER ]
    then
        echo "The $SSHFOLDER directory exists, updating permissions to $PERM700" && chmod $PERM700 $SSHFOLDER
        # fix how these variables are passed
        # echo "Folder permission is $SSHFOLDER_PERM";
    else
        echo "The file $SSHFOLDER does not exist; exiting."
        exit 1
fi
# ~/.SSH/AUTHORIZED_KEYS
if [ -e $KEYS ]
    then
        echo "The $KEYS file exists, updating permissions to $PERM644" && chmod $PERM644 $KEYS;
        stat -f %A $KEYS
    else
        echo "The file $KEYS does not exist; moving on. All this means is that you're not allowing anyone in."
fi
# ~/.SSH/KNOWN_HOSTS
if [ -e $HOSTS ]
    then
        echo "The $HOSTS file exists, updating permissions to $PERM644" && chmod $PERM644 $HOSTS;
        stat -f %A $HOSTS
    else
        echo "The file $HOSTS does not exist; moving on. All this means is that you have not yet connected to a remote host yet."
fi
# ~/.SSH/CONFIG
if [ -e $CONFIG ]
    then
        echo "The $CONFIG file exists, updating permissions to $PERM644" && chmod $PERM644 $CONFIG;
        stat -f %A $CONFIG
    else
        echo "The file $CONFIG does not exist; moving on. That's also OK."
fi
# ~/.SSH/PRIVATE_KEY
if [ -e $KEY_PRV ]
    then
        echo "The $KEY_PRV file exists, updating permissions to $PERM600" && chmod $PERM600 $KEY_PRV;
        stat -f %A $KEY_PRV
    else
        echo "The file $KEY_PRV does not exist; moving on. YOU SHOULD LOOK INTO THIS!"
fi
# ~/.SSH/PUBLIC_KEY
if [ -e $KEY_PUB ]
    then
        echo "The $KEY_PUB file exists, updating permissions to $PERM644" && chmod $PERM644 $KEY_PUB;
        stat -f %A $KEY_PUB
    else
        echo "The file $KEY_PUB does not exist; moving on. YOU SHOULD LOOK INTO THIS!"
fi
}

# Display octoal permission
# Mac OS: stat -f %A file.txt
# Linux: stat -c "%a %n" /Path/To/File
# Linux: stat -c %a /Path/To/File.txt
# CHECK IF $1 EXISTS -Z STRING; TRUE IF THE LENGTH OF STRING IS ZERO.
if [ -z "$1" ]
    then
        echo "You need to specify a valid keypair name. Usage: './cleanup_ssh_permissions.sh id_rsa'"
    else
        if [ -e $KEY_PUB ] && [ -e $KEY_PRV ]
            then
                #update_permissions
                echo "this is where we call the function"
            else
                echo "You specified the public keyfile '$KEY_PUB' and private keyfile '$KEY_PRV'; these files that you specified do not exist, exiting."
                exit 1
    fi
fi
exit 0
