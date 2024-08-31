#!/bin/bash

# Define the backup directory
BACKUP_DIR="$HOME/Config-Backup"

# Array of configuration files and directories to back up
CONFIG_FILES=(
    "$HOME/.zshrc"
    "$HOME/.config/nvim"

)

# Create the backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Initialize a Git repository if not already done
cd "$BACKUP_DIR"
if [ ! -d ".git" ]; then
    git init
    git remote add origin git@github.com:Htet-Phyo-Linn/Config-Backup.git  # Set up your remote repository URL
fi

# Sync the files from the array
for file in "${CONFIG_FILES[@]}"; do
    rsync -av --delete "$file" "$BACKUP_DIR"
done

# Commit and push the changes
cd $BACKUP_DIR
git add .
git commit -m "Auto-update backup on $(date)"
git push origin main
