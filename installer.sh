#!/usr/bin/env bash

RED='\033[0;31m'    # red color
GREEN='\033[0;32m'  # green color
NC='\033[0m'        # no color

H="$HOME"                                   # crappy variable i use to make $HOME short
CLONE="$H/soswavified-z-shell-${RANDOM}"    # the clone directory! it uses the $RANDOM variable for a random number to avoid repetition

check() # check function
{
  local prompt="$1" # a variable only available for this function that uses the first prompt
  echo -e "${GREEN}checking if ${prompt} exists...${NC}" # prints to inform the user what's about to happen (real)
  if command -v "$prompt" >/dev/null; then # if the command exists, run:
    echo -e "${GREEN}${prompt} found, resuming...${NC}" # prints that the command was found
    return 0 # returns 0 as proof of success
  else # if that didn't work:
    echo -e "${RED}${prompt} not found! attempting to install with various package managers...${NC}" # you know what this means
    if command -v "apt-get" >/dev/null; then # if command exists, blah blah
      sudo apt-get install "$prompt" || return 1 # try and install the prompt, if it didn't work, return a 1 as proof of FAILURE!
      return 0 # returns 0 as proof of success!
    elif command -v "pacman" >/dev/null; then # if that didn't work:
      sudo pacman -Syu "$prompt" || return 1
      return 0
    elif command -v "dnf" >/dev/null; then # if that also didn't work
      sudo dnf install "$prompt" || return 1
      return 0
    elif command -v "zypper" >/dev/null; then # if that also ALSO didn't work:
      sudo zypper in "$prompt" || return 1
      return 0
    else # if none of those worked:
      echo "${RED}package manager not found in installer, exiting...${NC}" ; return 1 # return 1 as proof of failure!
    fi # end of if statement
  fi # end of if statement
}

backup() # backup function
{
  local zBackUp="$H/zsh-backup-${RANDOM}" # local variable only available for this function
   if [[ -d "$H/.zsh" || -a "$H/.zshrc" ]]; then # if there is a directory called .zsh in users home directory or if there's a file called .zshrc in the home dir
       mkdir -p "$zBackUp" # makes a new directory in user's home dir using the local var as the name
       [[ -d "$H/.zsh" ]] && mv "$H/.zsh" "$zBackUp" # if dir exists, move
       [[ -a "$H/.zshrc" ]] && mv "$H/.zshrc" "$zBackUp" # if file exists, move
       echo -e "${GREEN}backup complete! the backup folder is ${zBackUp}/ in your \$HOME directory!${NC}"
       return 0 # return code of 0 (success)
   fi  # end
}

if [[ "$1" = "--start" || "$1" = "-S" ]]; then  # if the user adds the argument "--start" or "-S" to the script
  echo -e "${GREEN}starting installer..${NC}"
else # if it's something else
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
  exit 1 # return exit code of 1 (failure)
fi # end

while true; do
  echo -e "${RED}this script will use sudo in case you don't have either zsh or git, install them manually if you don't trust me with sudo!${NC}"
  read -p "do you wish to continue?" yn # reads line and converts it into a variable
  case $yn in # case user's answer was either:
    [Yy] ) break ;; # case it is either y or Y, break while loop if y or Y
    [Nn] ) exit 1;; # case it is either n or N, break while loop if n or N
    *    ) echo -e "${RED}WRONG INPUT! only [y/n]${NC}";; # anything else
  esac # end
done # end

if [[ "$2" = "--already-cloned" && -d "$3/.zsh" && -a "$3/.zshrc" ]]; then # if the third second prompt was "--already-cloned" and the folder .zsh and file .zshrc exist:
  echo -e "${GREEN}already-cloned applied, all essential files inside the folder were found${NC}"
  check zsh || echo -e "${RED}exit code of 1, exiting...${NC}" ; exit 1 # runs the function with the prompt, making it check for zsh! if fail, print why to user and exit with an exit code of 1
  backup # run the backup function
  mv "$3/.zsh" "$H" # move .zsh folder from third prompt to the home directory
  mv "$3/.zshrc" "$H" # move .zshrc file from third prompt to the home directory
else
  check git || echo -e "${RED}exit code of 1, exiting...${NC}" ; exit 1
  check zsh || echo -e "${RED}exit code of 1, exiting...${NC}" ; exit 1
  echo -e "${GREEN}already-cloned not applied, cloning codeberg repository... (the one i update the most)${NC}" # notify
  git clone --depth 1 https://codeberg.org/soswav/zsh.git "$CLONE" || echo -e "${RED}something went wrong!! check your internet connection, it may be that! exiting...${NC}" ; exit 1 # clone the repository from codeberg, print possible cause of the error and exit with an exit code of 1
  backup # run backup function
  mv "$CLONE/.zsh" "$H" # move .zsh dir to home dir
  mv "$CLONE/.zshrc" "$H" # move .zshrc file to home dir
  rm -rf "$CLONE" # remove the cloned directory
fi # end

echo -e "${GREEN}installation finished!${NC}" # end
