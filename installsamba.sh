#!/bin/bash

# created by Enigma007 of the ubuntu forums
# I took all of these steps from this web site: http://www.howtoforge.com/samba_setup_ubuntu_5.10
# I take no credit for the tutorial only for turning it into a script.
# Also feel free to edit this and make it better.
echo "Installing samba and other dependencies..."
sudo apt-get install samba samba-common samba-doc libcupsys2-gnutls10 libkrb53 winbind smbclient
echo "Enter workgroup name:"
read wkgrpname
echo "Enter server name:"
read servername
echo "[global]
   workgroup = $wkgrpname
   netbios name = $servername
   server string = %h server (Samba, Ubuntu)

   
   passdb backend = tdbsam
   security = user
   username map = /etc/samba/smbusers
   name resolve order = wins bcast hosts
   domain logons = yes
   preferred master = yes
   wins support = yes
   
   # Set CUPS for printing
   printcap name = CUPS
   printing = CUPS
   
   # Default logon
   logon drive = H:
#   logon script = scripts/logon.bat
   logon path = \\server1\profile\%U


   # Useradd scripts
   add user script = /usr/sbin/useradd -m %u
   delete user script = /usr/sbin/userdel -r %u
   add group script = /usr/sbin/groupadd %g
   delete group script = /usr/sbin/groupdel %g
   add user to group script = /usr/sbin/usermod -G %g %u
   add machine script = /usr/sbin/useradd -s /bin/false/ -d /var/lib/nobody %u
   idmap uid = 15000-20000
   idmap gid = 15000-20000


   # sync smb passwords woth linux passwords
   passwd program = /usr/bin/passwd %u
   passwd chat = *Enter\snew\sUNIX\spassword:* %n\n *Retype\snew\sUNIX\spassword:* %n\n .
   passwd chat debug = yes
   unix password sync = yes
   
   # set the loglevel
   log level = 3


[homes]
   comment = Home
   valid users = %S
   read only = no
   browsable = no


[printers]
   comment = All Printers
   path = /var/spool/samba
   printable = yes
   guest ok = yes
   browsable = no


[netlogon]
   comment = Network Logon Service
   path = /home/samba/netlogon
   admin users = Administrator
   valid users = %U
   read only = no


[profile]
   comment = User profiles
   path = /home/samba/profiles
   valid users = %U
   create mode = 0600
   directory mode = 0700
   writable = yes
   browsable = no" > /etc/samba/smb.conf
sudo mkdir /home/samba
sudo mkdir /home/samba/netlogon
sudo mkdir /home/samba/profiles
sudo mkdir /var/spool/samba
sudo chmod 777 /var/spool/samba/
sudo chown -R root:users /home/samba/
sudo chmod -R 771 /home/samba/
sudo /etc/init.d/samba restart
sudo smbpasswd -a root
sudo echo "root = Administrator" > /etc/samba/smbusers
echo "Samba is now configured. Run the adduser script to add users and the addshares script to add shared locations."
