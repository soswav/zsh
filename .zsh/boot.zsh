  ##            _     _ _           _             _   
  ##    ___ ___| |_  / | |_ ___ ___| |_   ___ ___| |_ 
  ##  _|- _|_ -|   |/ /| . | . | . |  _|_|- _|_ -|   |
  ## |_|___|___|_|_|_/ |___|___|___|_| |_|___|___|_|_|
  ##                  .zsh/boot.zsh
  ##            "things that run at boot"

SAVEHIST=1000000              ## how many lines the file can have
HISTFILE="$Z/.his/h.log"      ## history file

if [[ "$fetchAtBoot" = "true" ]] && command -v "$fetchTool" >/dev/null; then ### if the "fetchTool" variable (command) inside ".zshrc" exists and the "fetchAtBoot" var is true, then:
    $fetchTool ### runs mentioned fetch tool inside ".zshrc"
elif [[ "$notifsShow" = "true" && "$fetchAtBoot" = "true" ]]; then ### if the above didn't work but the "fetchAtBoot" & "notifsShow" variables inside ".zshrc" are true, then:
    echo "fetchTool \"$fetchTool\" not found!"
fi ### closes the if statement

if [[ "$isNix" = "true" ]]; then ### if the variable inside .zshrc called "isNix" has a value of "true", then:
  echo "Nix 󱄅 loves you! Love it back!"
fi ### closes the if statement

##### end of file
