  ##            _     _     _ _                           _   
  ##    ___ ___| |_  / |___| |_|___ ___ ___ ___   ___ ___| |_ 
  ##  _|- _|_ -|   |/ /| .'| | | .'|_ -| -_|_ -|_|- _|_ -|   |
  ## |_|___|___|_|_|_/ |__,|_|_|__,|___|___|___|_|___|___|_|_|
  ##                   .zsh/aliases.zsh
  ##        "the file where you add/remove aliases"

alias cclear="clear;source ~/.zshrc"                      ### reloads config, i personally use this for testing (or clearing my terminal)

### tools stuff, mostly checking if it exists

if check "$musicTool"; then
  alias m="$musicTool"
fi

if check "$fetchTool"; then
  alias fetch="$fetchTool"
fi

if check "$fileManager"; then
  alias f="$fileManager"
fi

### dirs stuff

if check "$dirTool"; then
  alias dirs="$dirTool --icons always -F -l"
  alias dirsa="$dirTool --icons always -F -la"
fi

cdl()
{
  if [[ -d "$1" ]]; then
    cd "$1"
    $dirTool --icons always -F -l "$2"
  elif [[ -a "$1" ]]; then
    echo "i'm sorry, but you're mentioning a file!"
  fi
}

##### end of file
