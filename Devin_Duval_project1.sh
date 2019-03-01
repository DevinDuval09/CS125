#!/bin/bash
#beginning of project
#make sandbox directory
echo "Make sandbox directory and chmod to 777."
sudo mkdir /sandbox
sudo chmod 777 /sandbox

#Download passwords from github
echo "Download password list."
sudo wget -O /sandbox/pswd_all.txt  https://raw.githubusercontent.com/danielmiessler/SecLists/master/Passwords/twitter-banned.txt

#shuffle pswd_all.txt, grab 100 records, and save to words.txt
  #shuffle is not working
echo "Shuffle password list and remove extra file."
sudo shuf /sandbox/pswd_all.txt | head -n 100 > /sandbox/words.txt
sudo rm /sandbox/pswd_all.txt

#add 5 users and randomly select 5 passwords from words.txt
echo "Create 5 users and assign passwords with a for loop."
for u in {1..5}
do
tmpusr=temp$u
rndmpsswd=$(shuf /sandbox/words.txt | head -n 1)
sudo useradd -mp $(openssl passwd -1 $rndmpsswd) -s /bin/bash $tmpusr
echo "UserID:" $tmpusr "has been created with the password: " $rndmpsswd
done
echo "Copy shadow file."
sudo cp /etc/shadow /sandbox/
echo "To call python program to crack new passwords, remove the new users, remove sandbox directory, and uncomment the last 2 lines."
#call python program
#echo "Call python script to crack passwords."
#sudo python3 /bin/DevinDuval.project1.crackpass.py
