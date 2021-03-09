#!/bin/sh
yay -S --noconfirm powerpill polybar ly-git compton-tryone-git ttf-material-design-icons ttf-weather-icons ttf-monapo nerd-fonts-hack gotop pkgtop downgrade ttf-ubraille visual-studio-code-bin google-chrome slack-desktop tusk posy-cursors 
sudo powerpill -S --noconfirm xorg-server xf86-video-ati mesa i3-gaps rofi xorg-xrdb xdg-user-dirs ttf-inconsolata ttf-font-awesome xorg-xrandr noto-fonts-cjk ibus ibus-hangul python python-pip python2 python2-pip jdk-openjdk nodejs npm zsh openssh tmux wget tcpdump gdb nmap radare2 lsd zip unzip neofetch scrot sshpass bat fd jq alsa-utils colordiff firefox vlc deepin-file-manager deepin-icon-theme mupdf feh alacritty network-manager-applet lxappearance bluez bluez-utils blueman 
sudo pip3 install i3altlayout
sudo mv /usr/share/fonts/gnu-free /tmp
sudo systemctl enable --now bluetoot