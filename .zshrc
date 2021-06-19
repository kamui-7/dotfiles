stty intr "^J"

# functions

mem() {
   ps -eo rss,pid,euser,args:100 --sort %mem \
      | grep -v grep | grep -i $@ | awk '{printf $1/1024 "MB"; $1=""; print }'
}

clipfile() {
  xclip -sel c < $1
}

fullpath(){
  realpath $1 | xclip -sel c
}

mcd() { 
  mkdir -p "$1" && cd "$1"
}

log() {
  echo -e "[$(date +'%a %F %T %z')] ${@}"
}

compile_kernel(){
  doas make -j4
  doas make modules_install install
  doas genkernel --install --kernel-config=/usr/src/linux/.config initramfs
  doas grub-mkconfig -o /boot/grub/grub.cfg
  doas emerge @module-rebuild
}

temp() {
    paste <(cat /sys/class/thermal/thermal_zone*/type) \
        <(cat /sys/class/thermal/thermal_zone*/temp) \
        | column -s $'\t' -t | sed 's/\(.\)..$/.\1°C/'
}

update() {
    doas emerge --sync
    doas emerge -auvDN @world --autounmask=y --autounmask-continue
    doas emerge --depclean -v
}

unins() {
    doas emerge --deselect ${@}
    doas emerge --depclean -v
}

backup() {
	doas borg create --compression lz4 \
		--verbose \
		--stats \
		--progress \
		--exclude-caches \
		--exclude '/dev/*' \
		--exclude '/proc/*' \
		--exclude '/sys/*' \
		--exclude '/tmp/*' \
		--exclude '/run/*' \
		--exclude '/mnt/*' \
		--exclude '/media/Backups/*' \
		--exclude '/lost+found/*' \
		--exclude '/export/*' \
		--exclude '/home/kamui/.cache/*' \
		--exclude '/home/kamui/.local/share/Trash' \
		/mnt/Storage/Backups/::$(date +"%b-%d" | awk '{print tolower($0)}') \
		/
}

# aliases
alias back='cd "$OLDPWD"'
alias bc='bc -lq'
alias chx='chmod u+x'
alias cmount="mount | column -t"
alias conf="yadm list | fzf | xargs nvim"
alias count='fd -t f | wc -l'
alias df='df -H'
alias du='du -ch'
alias h='history'
alias ka="killall"
alias ls="exa --color=always --icons -s type"
alias l="ls -l"
alias la="ls -la"
alias sl="ls"
alias lt='/bin/ls --human-readable --size -1 -S --classify'
alias mkdir='mkdir -pv'
alias myip='curl http://ifconfig.me/ip'
alias now='date +"%T"'
alias path='echo -e ${PATH//:/\\n}'
alias rm='figlet "bruh"; false' # reminder to not use rm 
alias tp="trash"
alias weather="curl wttr.in"
alias n="nnn"
alias e="doas emerge"
alias hekr="cat /dev/urandom | base64 -w 0"
alias tn="tmux new"
alias ta="tmux attach"
alias packages="cat /var/lib/portage/world | sed 's/.*\///g' | sort | less"
alias tree="ls --tree"

alias g='git'
alias gc="g clone"
alias ga='g add'
alias gb='g branch'
alias gcm='g commit -m'
alias gl='g log'
alias gpo='g push origin'
alias gs='g status'

alias c="cargo"
alias cr="c run"
alias ce="c check"
alias cb="c build"
alias ct="c test"

alias v="nvim"
alias vi='nvim'
alias vim='nvim'

export HISTSIZE=1000000000000000000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE

setopt hist_ignore_space
setopt autocd
setopt extendedglob

autoload -U compinit
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit

autoload -U promptinit
promptinit
prompt gentoo

autoload -Uz colors
colors

# plugins
source ~/programs/zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/programs/zsh_plugins/zsh-completions/zsh-completions.zsh
source ~/programs/zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/autojump/autojump.zsh
source /usr/share/fzf/key-bindings.zsh
source ~/programs/common/common.zsh

# vim-like navigation
bindkey "^P" up-line-or-search
bindkey "^N" down-line-or-search
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# edit current command in vim
zle -N edit-command-line
autoload -Uz edit-command-line
bindkey -M vicmd 'v' edit-command-line
bindkey -M viins '^C' vi-cmd-mode

source ~/.zshenv
test -r "~/.dir_colors" && eval $(dircolors ~/.dir_colors)
