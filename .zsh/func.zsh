  ##            _     _ ___                       _
  ##    ___ ___| |_  / |  _|_ _ ___ ___   ___ ___| |_
  ##  _|- _|_ -|   |/ /|  _| | |   |  _|_|- _|_ -|   |
  ## |_|___|___|_|_|_/ |_| |___|_|_|___|_|___|___|_|_|
  ##      "the file where the fuctions are found"

function check()
{
  if command -v "$1" >/dev/null; then
    return 0
  elif [[ "$notifsShow" = "true" ]]; then
    echo "command \"$1\" not found"
    return 1
  fi
}

##### end of file
