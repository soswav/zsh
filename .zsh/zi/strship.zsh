  ##            _     _     _   _     _ _                           _   
  ##    ___ ___| |_  / |___|_| / |___| |_|___ ___ ___ ___   ___ ___| |_ 
  ##  _|- _|_ -|   |/ /|- _| |/ /| .'| | | .'|_ -| -_|_ -|_|- _|_ -|   |
  ## |_|___|___|_|_|_/ |___|_|_/ |__,|_|_|__,|___|___|___|_|___|___|_|_|
  ##                      .zsh/zi/strship.zsh
  ##      "the file responsible for enabling/disabling starship"

zi ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zi light starship/starship

##### end of file
