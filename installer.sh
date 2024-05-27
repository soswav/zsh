#!/usr/bin/env bash

RED='\033[0;31m'    # red color
GREEN='\033[0;32m'  # green color
NC='\033[0m'        # white color (no color)

H="$HOME"
ZBACKUP="$H/zsh-backup-${RANDOM}"
CLONE="$H/soswavified-z-shell-${RANDOM}"

function checkzsh() {
   if command -v "zsh" >/dev/null; then
     echo -e "${GREEN}zsh found, resuming...${NC}"
   else
     echo -e "${RED}zsh not found! attempting to install...${NC}"
     if command -v "apt-get" >/dev/null; then
       sudo apt-get install zsh
     elif command -v "pacman" >/dev/null; then
       sudo pacman -Syu zsh
     elif command -v "dnf" >/dev/null; then
       sudo dnf install zsh
    elif command -v "zypper" >/dev/null; then
       sudo zypper in zsh
     elif command -v "nix-env" >/dev/null; then
       echo -e "${RED}please note that this installer will use nix-env: add \"zsh\" to your packages list if you're on nixos${NC}"
       nix-env -iA nixpkgs.zsh || echo -e "${RED}seems like you're using nixos! add \"zsh\" to your packages file!${NC}" ; exit
     fi
   fi
}

function backup() {
   if [[ -d "$H/.zsh" || -a "$H/.zshrc" ]]; then       
       mkdir -p "$ZBACKUP"
       [[ -d "$H/.zsh" ]] && mv "$H/.zsh" "$ZBACKUP"
       [[ -a "$H/.zshrc" ]] && mv "$H/.zshrc" "$ZBACKUP"
       echo -e "${GREEN}backup complete! the backup folder is $ZBACKUP/ in your \$HOME directory!${NC}"
   fi 
}

function checkgit() {
   if command -v "git" >/dev/null; then
     echo -e "${GREEN}git found, resuming...${NC}"
   else
     echo -e "${RED}git not found! attempting to install with various package managers..${NC}"
     if command -v "apt-get" >/dev/null; then
       sudo apt-get install git
     elif command -v "pacman" >/dev/null; then
       sudo pacman -Syu git
     elif command -v "dnf" >/dev/null; then
       sudo dnf install git
    elif command -v "zypper" >/dev/null; then
       sudo zypper in git
     elif command -v "nix-env" >/dev/null; then
       echo -e "${RED}please note that this installer will use nix-env: add \"git\" to your packages list if you're on nixos${NC}"
       nix-env -iA nixpkgs.git || echo -e "${RED}seems like you're using nixos! add \"git\" to your packages file!${NC}" ; exit
     fi
    fi
}

if [[ "$1" = "--start" || "$1" = "-S" ]]; then  # if the user adds the argument "--start" or "-S" to the script
  echo -e "${GREEN}starting installer..${NC}" ; sleep 3
else
  echo -e """
  ${RED}invalid option
  options:${NC}

  ${GREEN}
  --start           starts the installer
  -S                starts the installer
  --already-cloned  uses directory mentioned after \"start\"
  ${NC}
  example:
  ./installer.sh --start --already-cloned \$HOME/zsh
  or
  ./installer.sh -S
  """
  exit
fi

while true; do
  echo -e "${RED}this script will use sudo in case you don't have either zsh or git, install them manually if you don't trust me with sudo!${NC}"
  read -p "do you wish to continue?" yn
  case $yn in
    [Yy]* ) break;;
    [Nn]* ) exit;;
    * ) echo -e "${RED}WRONG INPUT! only [y/n]${NC}";;
  esac
done

if [[ "$2" = "--already-cloned" && -d "$3/.zsh" && -a "$3/.zshrc" ]]; then
  echo -e "${GREEN}already-cloned applied, all essential files inside the folder were found${NC}"
  checkzsh
  backup
  mv "$3/.zsh" "$H"
  mv "$3/.zshrc" "$H"
else
  checkgit
  echo -e "${GREEN}already-cloned not applied, cloning codeberg repository... (the one i update the most)${NC}"
  git clone https://codeberg.org/soswav/zsh.git $CLONE || echo -e "${RED}something went wrong, or the folder already exists... exiting...${NC}" ; exit
  checkzsh
  backup
  mv "$CLONE/.zsh" "$H"
  mv "$CLONE/.zshrc" "$H"
  rm -rf "$CLONE"
fi

while true; do
  echo -e "${GREEN}installation complete!\n\nhowever, i do recommend some packages to be used with my config! those are:${NC}"
  echo -e "
  fff             (a file manager)
  afetch          (fetch tool) 
  eza             (ls alternative)
  termusic        (music from the terminal)
  "
  read -p "do you want to download the extra stuff?" yn
  case $yn in
    [Yy]* ) break;;
    [Nn]* ) exit;;
    * ) echo -e "${RED}WRONG INPUT! only [y/n]${NC}";;
  esac
done

function erm() {
  local packages=("fff" "termusic" "eza" "afetch")
  echo -e "${RED}please note that this will only install the packages for people using either nix or yay!${NC}" ; sleep 5
}

erm
echo -e "i never said it was finished.."
