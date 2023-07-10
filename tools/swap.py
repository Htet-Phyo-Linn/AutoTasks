import os


try:
	dataSize = int(input("Swap file size ( default:1Gb[1024mb] ) : "))
	swapFileName = input("Swap file name : ")

	bs = 1024
	swapSize = bs*dataSize

	cmdList = [
		"dd if=/dev/zero of=/{} bs={} count=1048576 status=progress \n".format(swapFileName, swapSize),
		"chmod 600 /{}".format(swapFileName),
		"mkswap /{}".format(swapFileName),
		"swapon /{} \n".format(swapFileName)
	]
	
	# print (cmdList)
	for x in cmdList:
		os.system(x)

	fstabPath = "/etc/fstab"
	fstabSwapInfo = "/{}	swap	swap	defaults	0	0".format(swapFileName)
	
	fstab = open (fstabPath, 'a')
	fstab.write(fstabSwapInfo)
	fstab.close()

	os.system("\nswapon -s\n")

except Exception as e:
	raise print("Plz check your input.")


finally:
	print("\nSuccess! Your swapfile location is /{} \n".format(swapFileName))



#Run with root user.
#Written by Htet Phyo Lin.
#If you have any errors. plz contact me " htetphyolin18@ucsmgy.edu.mm " .

