UserCreate.sh

Creates a new user account and adds it to the group ftpusers.  Can optionally pass in a password otherwise it is set by default to McRae3730. The permissions on the users home folder is set to 701 so only that user can see it's contents.

sudo ./UserCreate.sh *Username* [Password] 

Examples:

	sudo ./UserCreate.sh TestUser
		Creates a new user called TestUser that has the password McRae3730 and is part of the ftpusers group

	sudo ./UserCreate.sh production client
		Creates a new user called production with the password client and is part of the ftpusers group






BasicUserCreate.sh

Creates a new user with the username you add as a parameter.  It then asks you to enter a password for that user.  Asks you to confirm the password.  Then adds that user to the ftpusers group.  It set's the permissions on the home folder to 701.

sudo ./BasicUserCreate.sh *Username*

Examples: 

	sudo ./UserCreate.sh production
		Creates a new user called production then asks you for a password.  Once you enter it and press the ENTER key is asks you to confirm the password.  Once confirmed it add the user to the ftpusers group, and creates the
		users home folder with 701 permissions.





vsftpd.conf

The config file for vsftpd.  The only change is to allow users to read and write to their home directory when connected through ftp.






COMMANDS TO RUN WHEN SETTING UP NEW FTP SERVER
________________________________________________

sudo apt update
sudo apt upgrade
sudo apt install vim
sudo apt install vsftpd

sudo groupadd ftpusers
sudo groupadd ftpadmins
sudo usermod -a -G ftpadmins rudy
mkdir /home/rudy/bin/
PATH=PATH:/home/rudy/bin

add /home/rudy/bin to the secure_path variable in the /etc/sudoers file using VIM.


