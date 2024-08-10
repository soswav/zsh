  ##            _     _             _   _                       _
  ##    ___ ___| |_  / |_ _ ___ ___| |_| |_ _____ ___   ___ ___| |_
  ##  _|- _|_ -|   |/ /| | |_ -|  _|  _|   |     |_ -|_|- _|_ -|   |
  ## |_|___|___|_|_|_/ |___|___|_| |_| |_|_|_|_|_|___|_|___|___|_|_|
  ##                         .zsh/usrthms.zsh
  ##           "themes (sort of) made by yours truely, soswav"

case "$userTheme" in # in case $userTheme is either:
  "rainbowBash")   PS1='%F{red}[%f%F{yellow}%n%f%F{green}@%f%F{blue}%m%f %F{magenta}%~%f%F{red}]%f$ ';; # [user@hostname ~]$ (the ~ is the directory)
  "elvishDefault") PS1="%~> " ;; # ~> (~ is directory)
  "weirdDefault")  PS1='%m%% ';; # hostname%
  "guideToZSH")    PS1='%n@%m %F{red}%/%f $ '       ;;  # https://dev.to/voracious/a-guide-to-customizing-the-zsh-shell-prompt-2an6
  "nixTheme")      PS1='%F{cyan}󱄅%f %F{blue}%~%f > ';;  # 󱄅 ~ > (the "~" is the directory)
  "n0tch2k")       PS1='%F{white}[%~]%f%F{red}>%f%F{yellow}>%f%F{white}>%f ';;
  *)               PS1='%m%% ';; # same as weirdDefault
esac

##### end of file
