#!/bin/bash

echo "Add meg a felhasznalo nevet:"
read name
sudo useradd $name -m -G users
sudo smbpasswd -a tom
echo "Kesz! A felhasznalo letrehozva."
