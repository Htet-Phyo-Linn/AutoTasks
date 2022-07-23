import os

ci = input("Commit name : ")

gitPush = [
	"git",
	"git status",
	"git add .",
	"git commit -m \"{}\"".format(ci),
	"git push",
]

for x in gitPush:
	os.system(x)


#Written by Htet Phyo Lin.
#If you have any errors. plz contact me " htetphyolin18@ucsmgy.edu.mm " .


