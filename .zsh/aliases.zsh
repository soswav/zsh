  ##            _     _     _ _                           _
  ##    ___ ___| |_  / |___| |_|___ ___ ___ ___   ___ ___| |_
  ##  _|- _|_ -|   |/ /| .'| | | .'|_ -| -_|_ -|_|- _|_ -|   |
  ## |_|___|___|_|_|_/ |__,|_|_|__,|___|___|___|_|___|___|_|_|
  ##                   .zsh/aliases.zsh
  ##        "the file where you add/remove aliases"

alias cclear="clear;source ~/.zshrc"                      ### reloads config, i personally use this for testing (or clearing my terminal)

### tools stuff, mostly checking if it exists

if check "$fetchTool"; then
  alias fetch="$fetchTool"
fi

### dirs stuff

if check "$dirTool"; then
  alias dirs="$dirTool --icons always -F -l"
  alias dirsa="$dirTool --icons always -F -la"
fi

##### end of file
