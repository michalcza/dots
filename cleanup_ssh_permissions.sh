#!/bin/sh

###################################################################
#Script Name    :cleanup_ssh_permissions.sh
#Verson         :V2
#Description    :Cleanup file permissions for SSH keys and folders
#Created        :24 November 2018
#Args           :
#Author         :Michal Czarnecki
#Email          :mczarnecki@gmail.com
#GitHub         :http://www.github.com/michalcza
###################################################################
#To Do          :shift into loops and functions
###################################################################
#Status         :Production
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
# CHECK IF $1 EXISTS -Z STRING; TRUE IF THE LENGTH OF STRING IS ZERO.
if [ -z "$1" ]
    then
        echo "You need to specify a valid keypair name. Usage: './cleanup_ssh_permissions.sh id_rsa'"
    else
        # WE CAN'T CHECK FOR FILE IF WE CAN'T SEE INTO THE FOLDER FIRST.
        echo "*** Looking for folder:"
        echo "$SSHFOLDER"
        if [ -d $SSHFOLDER ]
            then
                echo "Found. Updating permissions to $PERM700"
                chmod $PERM700 $SSHFOLDER
            else
                echo "Not Found. Either the folder $SSHFOLDER does not exist or you do not have rights to the folder; attempting to update permissions just in case it's there but you can't see it."
                chmod $PERM700 $SSHFOLDER
        fi
        # Now we can check for files inside the ~/.ssh folder
        echo "*** Looking for files:"
        echo "  Public:   '$KEY_PUB'"
        echo "  Private:  '$KEY_PRV'"
        if [ -e $KEY_PUB ] && [ -e $KEY_PRV ]
            then
                echo "  Found. Updating permissions..."
                #
                echo "  Permissions for $KEY_PRV before update:"
                stat -f %A $KEY_PRV || stat -c "%a %n" $KEY_PRV || stat -c %a $KEY_PRV
                chmod $PERM600 $KEY_PRV
                echo "  Permissions for $KEY_PRV after update:"
                stat -f %A $KEY_PRV || stat -c "%a %n" $KEY_PRV || stat -c %a $KEY_PRV
                #
                echo "  Permissions for $KEY_PUB before update:"
                stat -f %A $KEY_PUB || stat -c "%a %n" $KEY_PUB || stat -c %a $KEY_PUB
                chmod $PERM644 $KEY_PUB
                echo "  Permissions for $KEY_PUB after update:"
                stat -f %A $KEY_PUB || stat -c "%a %n" $KEY_PUB || stat -c %a $KEY_PUB
            else
                echo "Not found. Exiting."
                exit 1
        fi
        # ~/.SSH/AUTHORIZED_KEYS
        echo "*** Updating $KEYS"
        if [ -e $KEYS ]
            then
            echo "  Found. Updating permissions..."
                echo "  Permissions for $KEYS before update:"
                stat -f %A $KEYS || stat -c "%a %n" $KEYS || stat -c %a $KEYS
                chmod $PERM644 $KEYS
                echo "  Permissions for $KEYS after update:"
                stat -f %A $KEYS || stat -c "%a %n" $KEYS || stat -c %a $KEYS
            else
                echo "  The file $KEYS does not exist. That's OK, all this means is that you're not allowing anyone in; moving on."
        fi
        # ~/.SSH/KNOWN_HOSTS
        echo "*** Updating $HOSTS"
        if [ -e $HOSTS ]
            then
            echo "  Found. Updating permissions..."
                echo "  Permissions for $HOSTS before update:"
                stat -f %A $HOSTS || stat -c "%a %n" $HOSTS || stat -c %a $HOSTS
                chmod $PERM644 $HOSTS
                echo "  Permissions for $HOSTS after update:"
                stat -f %A $HOSTS || stat -c "%a %n" $HOSTS || stat -c %a $HOSTS
            else
                echo "The file $HOSTS does not exist; moving on. All this means is that you have not yet connected to a remote host yet."
        fi
                # ~/.SSH/CONFIG
        echo "*** Updating $CONFIG"
        if [ -e $CONFIG ]
            then
            echo "  Found. Updating permissions..."
                echo "  Permissions for $CONFIG before update:"
                stat -f %A $CONFIG || stat -c "%a %n" $CONFIG || stat -c %a $CONFIG
                chmod $PERM644 $CONFIG
                echo "  Permissions for $CONFIG after update:"
                stat -f %A $CONFIG || stat -c "%a %n" $CONFIG || stat -c %a $CONFIG
            else
                echo "The file $CONFIG does not exist. That's OK, moving on."
        fi
fi
echo "All done"
exit 0
