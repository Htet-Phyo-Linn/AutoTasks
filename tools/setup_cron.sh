#!/bin/bash

# Define the backup directory
BACKUP_DIR="~/Config-Backup"

# Create the backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Initialize a Git repository if not already done
cd "$BACKUP_DIR"
if [ ! -d ".git" ]; then
    git init
    git remote add origin git@github.com:Htet-Phyo-Linn/Config-Backup.git  # Set up your remote repository URL
fi

# Add a crontab entry to sync and update Git every hour
(crontab -l ; echo "0 * * * * rsync -av --delete ~/.zshrc ~/.config/nvim $BACKUP_DIR && \
cd $BACKUP_DIR && \
git add . && \
git commit -m \"Auto-update backup on \$(date)\" && \
git push origin main") | crontab -

echo "Crontab job set up successfully."

