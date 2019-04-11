#!/bin/bash

# created by Enigma007 of the ubuntu forums
# I took all of these steps from this web site: http://www.howtoforge.com/samba_setup_ubuntu_5.10
# I take no credit for the tutorial only for turning it into a script.
# Also feel free to edit this and make it better.
echo "Enter the name of the user:"
read name
sudo useradd $name -m -G users
sudo smbpasswd -a tom
echo "Done! User is now added."
