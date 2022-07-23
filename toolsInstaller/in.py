import os

toolList = [
"zsh",
"curl",
"git",
"net-tools",
"vlc",
"telegram-desktop",
"figlet",
"htop",
"neofetch",
"php",
"netdiscover",
"fonts-powerline",
"fonts-firacode",
"bpytop",
"mysql-server"
]

apt = "sudo apt-get install "

for x in toolList:
	os.system(apt + x + " -y")


othList = [
"sudo sh -c \"$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)\"",
"sudo mysql_secure_installation",
"sudo apt-get install phpmyadmin"
]

for y in othList:
	os.system(y)
