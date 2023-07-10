import os

def zsh_configuration(userName):
    zsh_config = open("zsh_config.txt", "r")

    cmd_list = []
    for line in zsh_config:
        cmd_list.append(line)

    Path = '/home/{}/.zshrc'.format(userName)

    for x in cmd_list:
       f = open(Path, "a")
       f.write(x)
       f.close()

    f = open(Path, "r")
    print(f.read())

userName = input('Desktop username : ')
zsh_configuration(userName)
