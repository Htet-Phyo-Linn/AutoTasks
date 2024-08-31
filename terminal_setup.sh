#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status
set -o pipefail  # Catch errors in pipelines

# Function to handle errors
error_exit() {
    echo "Error on line $1"
    exit 1
}

trap 'error_exit $LINENO' ERR

# Function to clone a Git repository
clone_repo() {
    local repo_url=$1
    local target_dir=$2
    if [ ! -d "$target_dir" ]; then
        echo "Cloning $repo_url..."
        git clone "$repo_url" "$target_dir"
    else
        echo "Directory $target_dir already exists. Skipping clone."
    fi
}

# Clone AutoTasks repository
clone_repo "https://github.com/Htet-Phyo-Linn/AutoTasks.git" "$HOME/AutoTasks"

# Run ssh_setup.py
echo "Running SSH setup..."
python3 "$HOME/AutoTasks/tools/setup_ssh.py"

# Install Oh My Zsh
echo "Installing Oh My Zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Zsh plugins
echo "Installing Zsh plugins..."
clone_repo "https://github.com/zsh-users/zsh-autosuggestions" "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
clone_repo "https://github.com/zsh-users/zsh-syntax-highlighting.git" "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

# Install vim-plug for Neovim
echo "Installing vim-plug for Neovim..."
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install Powerlevel10k theme
echo "Installing Powerlevel10k theme..."
clone_repo "https://github.com/romkatv/powerlevel10k.git" "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

# Install Powerline fonts
echo "Installing Powerline fonts..."
sudo apt install -y fonts-powerline

# Install custom fonts
echo "Installing custom fonts..."
rm -rf ~/.local/share/fonts
mkdir -p ~/.local/share/fonts
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
mv *.ttf ~/.local/share/fonts/

cd $HOME 
# Clone Config-Backup repository using SSH
clone_repo "git@github.com:Htet-Phyo-Linn/Config-Backup.git" "$HOME/Config-Backup"

# Run setup_config.py
echo "Restoring configuration files..."
python3 "$HOME/AutoTasks/tools/setup_config.py"

# Install Neovim plugins
echo "Run PlugInstall in Neovim"
nvim --headless +PlugInstall +qall

# Build coc.nvim
echo "Building coc.nvim..."
cd "$HOME/.local/share/nvim/plugged/coc.nvim"
npm ci
npm run build
