#!/usr/bin/env bash

RED='\033[0;31m'    # red color
GREEN='\033[0;32m'  # green color
NC='\033[0m'        # no color

H="$HOME"
CLONE="$H/soswavified-z-shell-${RANDOM}"

check()
{
  local prompt="$1"
  if command -v "$prompt" >/dev/null; then
    echo -e "${GREEN}${prompt} found, resuming...${NC}"
    return 0
  else
    echo -e "${RED}${prompt} not found! attempting to install with various package managers...${NC}"
    if command -v "apt-get" >/dev/null; then
      apt-get install "$prompt" || return 1
      return 0
    elif command -v "pacman" >/dev/null; then
      sudo pacman -Syu "$prompt" || return 1
      return 0
    elif command -v "dnf" >/dev/null; then
      sudo dnf install "$prompt" || return 1
      return 0
    elif command -v "zypper" >/dev/null; then
      sudo zypper in "$prompt" || return 1
      return 0
    else
      echo "${RED}package manager not found in installer, exiting...${NC}" ; exit 1
    fi
  fi
}

backup()
{
  local zBackUp="$H/zsh-backup-${RANDOM}"
   if [[ -d "$H/.zsh" || -a "$H/.zshrc" ]]; then       
       mkdir -p "$zBackUp"
       [[ -d "$H/.zsh" ]] && mv "$H/.zsh" "$zBackUp"
       [[ -a "$H/.zshrc" ]] && mv "$H/.zshrc" "$zBackUp"
       echo -e "${GREEN}backup complete! the backup folder is ${zBackUp}/ in your \$HOME directory!${NC}"
       return 0
   fi 
}

if [[ "$1" = "--start" || "$1" = "-S" ]]; then  # if the user adds the argument "--start" or "-S" to the script
  echo -e "${GREEN}starting installer..${NC}"
else
  echo -e """
  ${RED}invalid option!${NC}
  options:

  ${GREEN}
  --start           starts the installer
  -S                starts the installer
  --already-cloned  uses directory mentioned after \"--start\" or \"-S\"
  ${NC}
  for example:
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
    [Yy] ) break;;
    [Nn] ) exit;;
    * ) echo -e "${RED}WRONG INPUT! only [y/n]${NC}";;
  esac
done

if [[ "$2" = "--already-cloned" && -d "$3/.zsh" && -a "$3/.zshrc" ]]; then
  echo -e "${GREEN}already-cloned applied, all essential files inside the folder were found${NC}"
  check zsh || echo -e "${RED}exit code of 1, exiting...${NC}" ; exit 1
  backup
  mv "$3/.zsh" "$H"
  mv "$3/.zshrc" "$H"
else
  check git || echo -e "${RED}exit code of 1, exiting...${NC}" ; exit 1
  check zsh || echo -e "${RED}exit code of 1, exiting...${NC}" ; exit 1
  echo -e "${GREEN}already-cloned not applied, cloning codeberg repository... (the one i update the most)${NC}"
  git clone --depth 1 https://codeberg.org/soswav/zsh.git $CLONE || echo -e "${RED}something went wrong, or the folder already exists... exiting...${NC}" ; exit 1
  backup
  mv "$CLONE/.zsh" "$H"
  mv "$CLONE/.zshrc" "$H"
  rm -rf "$CLONE"
fi

echo -e "${GREEN}installation finished!${NC}"
