#!/bin/bash

echo "Add meg a megosztani kivant konyvtarat:"
read dirc
sudo mkdir -p $dirc
sudo chown -R root:users $dirc
sudo chmod -R ug+rwx,o+rx-w $dirc
echo "Add meg a megosztott mappa nevet:"
read name
echo "Add meg a megosztott mappa eleresi utjat:"
read path
echo "[$name]
  comment = $name
  path = $path
  valid users = @users
  force group = users 
  create mask = 0660
  directory mask = 0771
  writable = yes" > /etc/samba/smb.conf
echo "Kesz! A megosztott mappa letrejott."
