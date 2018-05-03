#!/bin/sh

sudo -v

sudo pacman -Syu
sudo pacman --noconfirm -S curl wget cmake base-devel clang
sudo pacman --noconfirm -S neovim python2-neovim python-neovim
sudo pacman --noconfirm -S scrot i3lock ruby xclip python-pip
sudo pacman --noconfirm -S adobe-source-code-pro-fonts feh rofi pamixer alsa-utils chromium xfce4-screenshooter compton qutebrowser qt5-webkit pdfjs

aurman --noconfirm -S asymptote zathura zathura-djvu zathura-ps zathura-pdf-mupdf firefox-nightly dropbox imagemagick ttf-google-fonts-git
aurman --noconfirm -S texlive-most
