import os
import shutil
from pathlib import Path

# Define the backup directory and target locations
backup_dir = Path.home() / "Config-Backup"

# Dictionary of files and directories to restore with their target locations
config_files = {
    ".zshrc": Path.home(),               # .zshrc file to be restored to home directory
    "nvim": Path.home() / ".config",  # nvim directory to be restored to ~/.config directory
    # Add more files and directories here as needed
}

def restore_configs():
    for item, target_base in config_files.items():
        source = backup_dir / item
        target = target_base / Path(item).name

        if source.is_dir():
            # Recursively copy directory
            if target.exists():
                print(f"Removing existing directory: {target}")
                shutil.rmtree(target)
            print(f"Copying directory: {source} to {target}")
            shutil.copytree(source, target)
        elif source.is_file():
            # Copy file
            if target.exists():
                print(f"Removing existing file: {target}")
                target.unlink()
            print(f"Copying file: {source} to {target}")
            shutil.copy2(source, target)
        else:
            print(f"Source {source} does not exist. Skipping...")

if __name__ == "__main__":
    restore_configs()
    print("Configuration setup complete.")

