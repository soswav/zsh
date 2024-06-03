# soswavified-zsh
*z shell but at my likings*

this currently needs:
```diff
+ zsh (duh)
+ a brain (optional)
```

## yeah yeah, but how do i install it?
simple! just clone the repo and move all the files *(.zshrc and .zsh)* to your home directory

```sh
cd "$HOME" ; git clone https://codeberg.org/soswav/zsh.git
```
considering that you're **not** using the installer, you probably already know some stuff about your terminal!

now, just move the old `.zshrc` file to whereever you want as i **seriously** want you to backup your stuff

now that you've done that, just run:
```sh
mv $HOME/zsh/.zsh $HOME ; mv $HOME/zsh/.zshrc $HOME
```
that should move the files to your home folder

## nah, i'm too lazy for cloning and moving the files a bit
1. first of all: ok
2. second of all: sure!

just run this in your terminal:
```sh
cd $HOME ; curl -O https://codeberg.org/soswav/zsh/raw/branch/main/installer.sh ; chmod u+x installer.sh ; ./installer.sh
```
>**WARNING:**
> don't run random scripts you find in the internet..

ehem, it sends you to your home directory, downloads the installer, makes it executable, and executes it!

you should also read the installer file but considering you're **this** lazy, you probably won't read it...

## this is atrocious
open a issue and tell me what i should improve then!

...and don't be mean, please?

### userthemes? what??
i'm currently trying to implement booleans in my config! i'm also attempting to make good-looking themes

here's what **some** of them look like:

![](./assets/rainbowBash.png "rainbowBash")
![](./assets/elvishDefault.png "elvishDefault")
![](./assets/weirdDefault.png "weirdDefault")
![](./assets/guideToZSH.png "guideToZSH")
![](./assets/nixTheme.png "nixTheme")

>[!NOTE]
>ignore my screenshot skills

## notes
1. feel free to open pull requests to enhance this thing..
