  ##            _     _     _   _ _   _               _   
  ##    ___ ___| |_  / |___|_| / | |_| |___   ___ ___| |_ 
  ##  _|- _|_ -|   |/ /|- _| |/ /| | . |  _|_|- _|_ -|   |
  ## |_|___|___|_|_|_/ |___|_|_/ |_|___|_| |_|___|___|_|_|                                                     
  ##                  .zsh/zi/ldr.zsh
  ##                 "zinit loader file"

if [[ ! -f $H/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$H/.local/share/zinit" && command chmod g-rwX "$H/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$H/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$H/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

##### end of file
