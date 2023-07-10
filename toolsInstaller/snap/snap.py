import os
import csv


arr = []
ins = "sudo snap install"

os.system("sudo systemctl restart snapd.service")

with open("snap.csv", "r") as data:
	for line in csv.reader(data):
		#print(line)
		arr.append(line)



for x in arr:
	def listToString(x):
		str1 = " "
		for s in x:
			str1+=s

		return str1

	ss = listToString(x)
	os.system(ins + ss)



#Written by Htet Phyo Lin.
#If you have any errors. plz contact me " htetphyolin18@ucsmgy.edu.mm " .


