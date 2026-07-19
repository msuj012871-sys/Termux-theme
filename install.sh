#!/data/data/com.termux/files/usr/bin/bash
pkg update -y
pkg install git ruby figlet toilet -y
gem install lolcat
mkdir -p ~/.termux
cp sumon/colors.properties ~/.termux/colors.properties
cat >> ~/.bashrc <<'EOF'
clear
figlet -f big SUMON | lolcat
echo "Welcome to SUMON Theme" | lolcat
PS1='┌─[SUMON@Termux]-[\w]\n└─➤ '
EOF
termux-reload-settings 2>/dev/null || true
echo "Installed. Restart Termux."
