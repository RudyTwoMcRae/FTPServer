#!/bin/sh

sUser=$1
sPass=${2-McRae3730}

sudo useradd -g ftpusers -m $sUser
echo "$sUser:$sPass" | chpasswd
sudo chmod 701 /home/$sUser

