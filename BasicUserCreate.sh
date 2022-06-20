#!/bin/sh

sUser=$1
sudo useradd -g ftpusers -m $sUser
sudo passwd $sUser
sudo chmod 701 /home/$sUser

