  ##            _
  ##    ___ ___| |_ ___ ___
  ##  _|- _|_ -|   |  _|  _|
  ## |_|___|___|_|_|_| |___|
  ##         .zshrc
  ##     "the file where
  ##       you edit the
  ##         options!"

## tools
fetchTool="neofetch"         ## to be used inside aliases.zsh and boot.zsh (string)
  fetchAtBoot="false"        ## shows specified fetch tool at startup (boolean)
dirTool="eza"                ## to be used inside aliases.zsh, configure aliases.zsh since it already comes with some options, eza is recommended! (string)
notifsShow="true"            ## notifies you in case you break something (boolean)
userTheme="n0tch2k"          ## check usrthms.zsh for the previews (and names)

## useful stuff
H="$HOME"                    ## shortcut for other files
Z="$H/.zsh"                  ## easy access for soucing files inside .zsh

### loads

source "$Z/zi/func.zsh"      ## loads functions
source "$Z/zi/ldr.zsh"       ## loads zinit
source "$Z/zi/plgns.zsh"     ## loads plugins
source "$Z/boot.zsh"         ## loads boot stuff (needed for command history)
source "$Z/usrthms.zsh"      ## user themes, check the file as it contains the booleans for the themes! "weirdDefault" is enabled by default
source "$Z/aliases.zsh"      ## loads aliases
# source "$Z/zi/strship.zsh" ## loads starship

##### end of file
