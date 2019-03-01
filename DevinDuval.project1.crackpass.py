import sys
import os
import crypt

print("Set password list and shadow file as variables.")
file = open("/sandbox/words.txt","r")
pwords = open("/sandbox/shadow","r") 
contents=file.readlines()
passwords=pwords.readlines()
##turn wordlist into python dictionary of words ; crypted word
CryptList=[]
DictPsswd=dict()
print("Use a for loop to create list of passwords.")
for line in contents:
	wd=str(line.splitlines())
	w=wd[2:len(wd)-2]
	CryptList.append(w)
print("Create dictionary of user names and hashed password.")
for ln in passwords:
	spl = ln.split(":")
	if (spl[1] != "!" and spl[1] != "*"):
		upd = {spl[0]:spl[1]}
		if bool(DictPsswd):
			DictPsswd[spl[0]]=spl[1]
		else:
			DictPsswd[spl[0]]=spl[1]
print("Hash list of passwords and compare to user's hashed passwords.")
for c in CryptList:
	for w,h in DictPsswd.items():
		if crypt.crypt(c,h)==h:
			print("User {}'s password is {}".format(w,c))
		else:
			pass
