#!/bin/bash

# Exit script if any command fails
set -e

echo "Updating packages..."
sudo apt update && sudo apt upgrade -y

echo "Installing Apache2..."
sudo apt install apache2 -y

echo "Installing PHP and common modules..."
sudo apt install php php-cli php-curl php-mysql php-mbstring php-xml php-bcmath php-zip php-soap php-intl php-gd libapache2-mod-php -y

echo "Restarting Apache..."
sudo systemctl restart apache2

echo "Installing Composer (PHP package manager)..."
sudo apt install curl -y
curl -sS https://getcomposer.org/installer | php
sudo mv composer.phar /usr/local/bin/composer
composer --version

echo "Installing Node.js (latest LTS version)..."
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs
node -v
npm -v

echo "Installing Yarn package manager..."
npm install -g yarn
yarn -v

echo "Installing MongoDB..."
sudo apt install -y mongodb
sudo systemctl enable mongodb
sudo systemctl start mongodb
mongo --eval 'db.runCommand({ connectionStatus: 1 })'

echo "Installing global packages: nodemon, express-generator, create-react-app..."
npm install -g nodemon express-generator create-react-app

echo "Installing Laravel Installer globally..."
composer global require laravel/installer
echo 'export PATH="$HOME/.composer/vendor/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
laravel --version

echo "Enabling Apache mod_rewrite (important for Laravel)..."
sudo a2enmod rewrite
sudo systemctl restart apache2

echo "Setting correct Apache AllowOverride for Laravel (.htaccess to work)..."
sudo sed -i '/<Directory \/var\/www\/>/,/<\/Directory>/ s/AllowOverride None/AllowOverride All/' /etc/apache2/apache2.conf
sudo systemctl restart apache2

echo "✅ All packages for MERN Stack, Laravel, Apache2, and PHP are installed successfully!"

