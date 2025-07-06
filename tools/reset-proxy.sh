
#!/bin/bash

echo "🔄 Resetting system-wide proxy settings..."

# --- Environment variables ---
sudo rm -f /etc/profile.d/proxy.sh
unset http_proxy https_proxy ftp_proxy https_proxy no_proxy

# --- APT ---
sudo rm -f /etc/apt/apt.conf.d/95proxies

# --- Wget ---
sed -i '/_proxy/d' ~/.wgetrc 2>/dev/null

# --- Curl ---
rm -f ~/.curlrc

# --- Git ---
git config --global --unset http.proxy
git config --global --unset https.proxy

# --- GNOME ---
if command -v gsettings >/dev/null; then
  gsettings set org.gnome.system.proxy mode 'none'
  echo "✅ GNOME proxy disabled"
fi

# --- KDE / XFCE (environment.d) ---
rm -f ~/.config/environment.d/proxy.conf

echo "✅ Proxy reset completed. You may need to log out and back in for full effect."
