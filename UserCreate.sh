#!/bin/sh

sUser=$1
sPass=${2-McRae3730}

#Create the user with a password
sudo useradd -g ftpusers -m $sUser
echo "$sUser:$sPass" | chpasswd

#add the home folder to the ftpadmins group so that McRae Employees can access the files
sudo chown $sUser:ftpadmins /home/$sUser
sudo chgrp ftpadmins /home/$sUser

#Change the permissions for the users home folder to owner-rwx, group-rwx, other-x
sudo chmod 771 /home/$sUser

