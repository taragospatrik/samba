#!/bin/bash

# created by Enigma007 of the ubuntu forums
# I took all of these steps from this web site: http://www.howtoforge.com/samba_setup_ubuntu_5.10
# I take no credit for the tutorial only for turning it into a script.
# Also feel free to edit this and make it better. 
echo "Enter the directory to be shared:"
read dirc
sudo mkdir -p $dirc
sudo chown -R root:users $dirc
sudo chmod -R ug+rwx,o+rx-w $dirc
echo "Enter name for shared folder:"
read name
echo "Enter path of shared folder:"
read path
echo "[$name]
  comment = $name
  path = $path
  valid users = @users
  force group = users 
  create mask = 0660
  directory mask = 0771
  writable = yes" > /etc/samba/smb.conf
echo "Done! Shared folder added."
