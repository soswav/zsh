  ##            _           
  ##    ___ ___| |_ ___ ___ 
  ##  _|- _|_ -|   |  _|  _|
  ## |_|___|___|_|_|_| |___|                       
  ##         .zshrc
  ##     "the file where
  ##       you edit the
  ##         options!"

## tools
fetchTool="nitch"            ## to be used inside aliases.zsh and boot.zsh (string)
  fetchAtBoot="true"         ## shows specified fetch tool at startup (boolean)
musicTool="termusic"         ## music tool to be used inside aliases.zsh (string)
dirTool="eza"                ## to be used inside aliases.zsh, configure aliases.zsh since it already comes with some options, eza is recommended! (string)
fileManager="nimmm"          ## terminal filemanager to use (string)
isNix="false"                ## sends message from "boot.zsh" if true (boolean)
notifsShow="true"            ## notifies you in case you break something (boolean)
userTheme="weirdDefault"     ## check usrthms.zsh for the previews (and names)

## useful stuff
H="$HOME"                    ## shortcut for other files
Z="$H/.zsh"                  ## easy access for soucing files inside .zsh

check()
{
  if command -v "$1" >/dev/null; then
    return 0
  elif [[ "$notifsShow" = "true" ]]; then
    echo "command \"$1\" not found"
    return 1
  fi
}

### loads

source "$Z/zi/ldr.zsh"       ## loads zinit
source "$Z/zi/plgns.zsh"     ## loads plugins
source "$Z/boot.zsh"         ## loads boot stuff (needed for command history)
source "$Z/usrthms.zsh"      ## user themes, check the file as it contains the booleans for the themes! "weirdDefault" is enabled by default
source "$Z/aliases.zsh"      ## loads aliases
# source "$Z/zi/strship.zsh" ## loads starship

##### end of file
