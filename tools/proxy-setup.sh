
#!/bin/bash

# === CONFIGURE YOUR PROXY HERE ===
IP="192.168.99.26"
PROXY="http://$IP:8080"
NO_PROXY_LIST="localhost,127.0.0.1,::1"

# === 1. Environment Variables ===
echo "Setting environment variables..."
export http_proxy="$PROXY"
export https_proxy="$PROXY"
export ftp_proxy="$PROXY"
export no_proxy="$NO_PROXY_LIST"

cat <<EOF | sudo tee /etc/profile.d/proxy.sh >/dev/null
export http_proxy=$PROXY
export https_proxy=$PROXY
export ftp_proxy=$PROXY
export no_proxy=$NO_PROXY_LIST
EOF

sudo chmod +x /etc/profile.d/proxy.sh

# === 2. APT ===
echo "Configuring APT..."
cat <<EOF | sudo tee /etc/apt/apt.conf.d/95proxies >/dev/null
Acquire::http::Proxy "$PROXY";
Acquire::https::Proxy "$PROXY";
Acquire::ftp::Proxy "$PROXY";
EOF

# === 3. Wget ===
echo "Configuring wget..."
cat <<EOF >> ~/.wgetrc
http_proxy = $PROXY
https_proxy = $PROXY
ftp_proxy = $PROXY
no_proxy = $NO_PROXY_LIST
EOF

# === 4. Curl ===
echo "Configuring curl..."
cat <<EOF >> ~/.curlrc
proxy = "$PROXY"
EOF

# === 5. Git ===
echo "Configuring git..."
git config --global http.proxy "$PROXY"
git config --global https.proxy "$PROXY"

# === 6. GNOME Desktop (Kali Default) ===
if command -v gsettings >/dev/null; then
    echo "Setting GNOME proxy settings..."
    gsettings set org.gnome.system.proxy mode 'manual'
    gsettings set org.gnome.system.proxy.http host "$IP" 
    gsettings set org.gnome.system.proxy.http port 8080
    gsettings set org.gnome.system.proxy.https host "$IP"
    gsettings set org.gnome.system.proxy.https port 8080
    gsettings set org.gnome.system.proxy.ftp host "$IP"
    gsettings set org.gnome.system.proxy.ftp port 8080
    gsettings set org.gnome.system.proxy ignore-hosts "['localhost', '127.0.0.1']"
fi

# === 7. KDE (Plasma) or XFCE (lightdm) environments (manual export) ===
DESKTOP_ENV=$(echo $XDG_CURRENT_DESKTOP | tr '[:upper:]' '[:lower:]')
if [[ "$DESKTOP_ENV" == *"kde"* || "$DESKTOP_ENV" == *"xfce"* ]]; then
    echo "To apply system-wide proxy on KDE/XFCE, ensure environment variables are loaded by session."
    mkdir -p ~/.config/environment.d
    cat <<EOF > ~/.config/environment.d/proxy.conf
http_proxy=$PROXY
https_proxy=$PROXY
ftp_proxy=$PROXY
no_proxy=$NO_PROXY_LIST
EOF
fi

echo "✅ Proxy setup completed for desktop and CLI tools."
