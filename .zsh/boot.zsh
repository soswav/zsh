  ##            _     _ _           _             _
  ##    ___ ___| |_  / | |_ ___ ___| |_   ___ ___| |_
  ##  _|- _|_ -|   |/ /| . | . | . |  _|_|- _|_ -|   |
  ## |_|___|___|_|_|_/ |___|___|___|_| |_|___|___|_|_|
  ##                  .zsh/boot.zsh
  ##            "things that run at boot"

SAVEHIST=1000000              ## how many lines the file can have
HISTFILE="$Z/.his/h.log"      ## history file

export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:$H/.local/share/bin:$H/.nimble/bin:$H/.nix-profile/bin

if [[ "$fetchAtBoot" = "true" ]] && check $fetchTool; then ### if the "fetchTool" variable (command) inside ".zshrc" exists and the "fetchAtBoot" var is true, then:
  $fetchTool ### runs mentioned fetch tool inside ".zshrc"
fi

##### end of file
