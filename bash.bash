#!/bin/bash
echo -n 'VVEDI NOMER : '
read int 
echo "$int" > aknomber.txt 
sleep 2
echo "РџРѕРґРѕР¶РґР°Р»Рё"
sudo apt-get update 
sudo apt install expect -y
# cozdadum skript avtootveta
echo -e '#!/usr/bin/expect\nspawn sudo apt-get upgrade -y \nexpect "Package configuration"'> /root/autootvet.sh
echo 'send "111\r"' >> /root/autootvet.sh
echo 'expect -re "# $"' >> /root/autootvet.sh
chmod 777 autootvet.sh
./autootvet.sh 
# ------------
sudo apt install git -y 
apt-get install -y python3 python3-pip 
apt install unzip 
sudo apt install -y libsodium-dev cmake g++ git
sleep 3
# Р’С‚РѕСЂРѕР№ СЌС‚Р°Рї-----------------------------------------------
sudo apt install python3-pip
sudo apt update
sudo apt install curl -y
sudo apt-get install screen git 
curl https://rclone.org/install.sh | sudo bash 
sudo pip3 install -r requirements.txt
sleep 2
# РўСЂРµС‚РёР№ СЌС‚Р°Рї -----------------------------------------------------
cd
chmod 777 trans.sh
chmod 777 Copi1.sh
chmod 777 Copi.sh
mkdir /aws32 
screen -dmS mount rclone mount --daemon aws32: /aws32 
mkdir /baws32 
screen -dmS mount rclone mount --daemon baws32: /baws32 
# Р§РµС‚РІРєСЂС‚С‹Р№ --------------------------------------------------
cd
# РњРѕРЅС‚РёСЂСѓРµРј РґРёСЃРє 1
parted /dev/nvme1n1 --script mklabel gpt mkpart xfspart xfs 0% 100%
mkfs.xfs -f /dev/nvme1n1
partprobe /dev/nvme1n1
mkdir /disk1
mount /dev/nvme1n1 /disk1
# РњРѕРЅС‚РёСЂСѓРµРј РґРёСЃРє 2
parted /dev/nvme2n1 --script mklabel gpt mkpart xfspart xfs 0% 100%
mkfs.xfs -f /dev/nvme2n1
partprobe /dev/nvme2n1
mkdir /disk2
mount /dev/nvme2n1 /disk2
# РњРѕРЅС‚РёСЂСѓРµРј РґРёСЃРє 3
parted /dev/nvme3n1 --script mklabel gpt mkpart xfspart xfs 0% 100%
mkfs.xfs -f /dev/nvme3n1
partprobe /dev/nvme3n1
mkdir /disk3
mount /dev/nvme3n1 /disk3
# РњРѕРЅС‚РёСЂСѓРµРј РґРёСЃРє 4
parted /dev/nvme4n1 --script mklabel gpt mkpart xfspart xfs 0% 100%
mkfs.xfs -f /dev/nvme4n1
partprobe /dev/nvme4n1
mkdir /disk4
mount /dev/nvme3n1 /disk4
# РЎРѕР·РґР°РµРј РґРµСЂРёРєС‚РѕСЂРёРё РЅР° РґРёСЃРєР°С…
cd /disk4
mkdir osnova
cd /disk4
mkdir osnova1
cd /disk4 
mkdir beckup
cd /disk4 
mkdir beckup1
cd /disk1
mkdir vid1 
cd /disk2
mkdir vid2
cd /disk3
mkdir video1
cd /disk3
mkdir video
cd /disk4
mkdir video
cd /root
# РљР°С‡Р°РµРј РїР»РѕС‚С‚РµСЂ Рё СѓСЃС‚Р°РЅР°РІР»РёРІР°РµРј 
cd
git clone https://github.com/madMAx43v3r/chia-plotter.git 
sleep 3
cd chia-plotter
git submodule update --init
sleep 3
./make_devel.sh
sleep 5
cd
# Р—РђРїСѓСЃРє РџР»РѕС‚РµСЂР° ------------------------------
screen -dmS Copi1 ./Copi1.sh
screen -dmS Copi ./Copi.sh
screen -dmS videorender1 ./chia-plotter/build/chia_plot -n -1 -r 16 -u 256 -t /disk1/vid1/ -2 /disk2/vid2/ -d /disk3/video/ -f b8e1d57e3e2dbb40ac8f2b257b762d05fcfc5b79c32a22255424644b7d183daa7c454624783f2d959c02eb1d2a4ba3a3 -p 91ea997633345082b15f83b957449180037030b6b7485f07ed4ee7558d08d3efbccf2c3d68ba724f5b3a8281a0055e27
screen -dmS videorender2 ./chia-plotter/build/chia_plot -n -1 -r 16 -u 256 -t /disk1/vid1/ -2 /disk2/vid2/ -d /disk3/video1/ -f b8e1d57e3e2dbb40ac8f2b257b762d05fcfc5b79c32a22255424644b7d183daa7c454624783f2d959c02eb1d2a4ba3a3 -p 91ea997633345082b15f83b957449180037030b6b7485f07ed4ee7558d08d3efbccf2c3d68ba724f5b3a8281a0055e27
screen -dmS otchet python3 awsstat.py
screen -dmS trans ./trans.sh
screen -r trans
