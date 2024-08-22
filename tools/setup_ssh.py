import os
import subprocess

# Variables
email = "htetphyolin642@gmail.com"
ssh_key_path = os.path.expanduser("~/.ssh/id_rsa_github")

# Generate SSH key
subprocess.run(["ssh-keygen", "-t", "rsa", "-b", "4096", "-C", email, "-f", ssh_key_path, "-N", ""])

# Start the ssh-agent in the background
subprocess.run(["eval", "$(ssh-agent -s)"], shell=True)

# Add your SSH private key to the ssh-agent
subprocess.run(["ssh-add", ssh_key_path])

# Display the public key so you can copy it
print("Copy the following SSH public key to GitHub:")
with open(f"{ssh_key_path}.pub", "r") as pub_key_file:
    print(pub_key_file.read())

# Optionally, you can open the GitHub SSH keys page directly
print("Opening GitHub SSH keys page...")
subprocess.run(["xdg-open", "https://github.com/settings/ssh/new"])

