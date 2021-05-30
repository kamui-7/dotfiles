export PATH=$HOME/.scripts:$HOME/.local/bin:~/.cargo/bin$PATH
export VISUAL="nvim"
export PAGER="less"
export EDITOR="nvim"
export BROWSER="firefox"
export SHELL="zsh"
export QT_QPA_PLATFORMTHEME=qt5ct
export FZF_DEFAULT_COMMAND='fd --type f --hidden | grep -v ".git/"'
export FZF_DEFAULT_OPTS='--color=fg:#e5e9f0,bg:#2e3440,hl:#81a1c1
                         --color=fg+:#e5e9f0,bg+:#2e3440,hl+:#81a1c1
                         --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
                         --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b
                         --color=border:#81a1c1
                         --padding=1'
BLK="0B" CHR="0B" DIR="04" EXE="06" REG="00" HARDLINK="06" SYMLINK="06" MISSING="00" ORPHAN="09" FIFO="06" SOCK="0B" OTHER="06"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
export NNN_TRASH=1
export NNN_OPTS="erUx"
export BAT_THEME="base16"
export _JAVA_AWT_WM_NONREPARENTING=1
source "$HOME/.cargo/env"
