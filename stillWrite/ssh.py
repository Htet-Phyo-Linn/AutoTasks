import os

def newKey():
	gmail = input("Enter your gmail : ")
	os.system("ssh-keygen -t ed25519 -C \"{}\"".format(gmail))
	os.system("ls -al ~/.ssh")


def main():
	back - [
	"eval \"$(ssh-agent -s)\"",
	"ssh-add ~/.ssh/id_ed25519",
	"ls -al ~/.ssh"
	]

def change():
	os.system("ssh-keygen -p -f ~/.ssh/id_ed25519")


if __name__ == '__main__':
	

	main()
	newKey()