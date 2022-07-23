f = open("/etc/resolv.conf", "w")
f.write("nameserver 127.0.0.1\nnameserver 8.8.4.4\nnameserver 8.8.8.8")
f.close()

#open and read the file after the appending:
f = open("/etc/resolv.conf", "r")
print(f.read())