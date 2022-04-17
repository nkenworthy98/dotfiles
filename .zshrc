# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '$HOME/.zshrc'

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit
compinit
# End of lines added by compinstall

setopt HIST_FIND_NO_DUPS
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY

# Extra zsh plugins
ZSH_PLUGINS_DIR="$HOME/.otherPrograms/zsh-plugins"
source "$ZSH_PLUGINS_DIR/zsh-history-substring-search/zsh-history-substring-search.zsh"

# bindkey "^P" up-line-or-search
# bindkey "^N" down-line-or-search
bindkey "^P" history-substring-search-up
bindkey "^N" history-substring-search-down

# If you come from bash you might have to change your $PATH.
export PATH="$PATH:$HOME/bin:$HOME/bin/perl_scripts:$HOME/bin/ocr-scripts:$HOME/bin/tmr-scripts:/usr/local/bin:$HOME/.local/bin:$HOME/go/bin"

# export MAIN_CUSTOM_COLOR='#2d6580'
# export MAIN_CUSTOM_COLOR='#3c64a9'
# export MAIN_CUSTOM_COLOR='#154889'
export MAIN_CUSTOM_COLOR='#E43348'
PROMPT="%B%F{magenta}[%F{$MAIN_CUSTOM_COLOR}%n%f%F{$MAIN_CUSTOM_COLOR}@%F{$MAIN_CUSTOM_COLOR}%m%f %F{cyan}%B%c%F{magenta}]%b%f%# "
# PROMPT="%F{$MAIN_CUSTOM_COLOR}%1~%f# "

# This is needed in order for TRAMP to work
# This needs to be in the remote machine's shell rc file
[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ '

alias em='emacs -nw'
alias yv='pipe-viewer -360'
alias pm='pulsemixer'
alias nb='newsboat'
alias pacman-remove-dependencies='sudo pacman -Rs $(pacman -Qqtd)'
alias convert-md-to-org='find . -name "*.md" | while read i; do pandoc -f markdown -t org "$i" -o "${i%.*}.org"; done'
alias tuir='tuir -s livestreamfail'
alias n3='nnn'

# Color Aliases
alias ls='ls --color=auto'

# Use for dotfiles
alias config='/usr/bin/git --git-dir="$HOME"/.dotfiles/ --work-tree="$HOME"'

# Aliases to change where config files should be,
# which should be in the .config directory
alias irssi='irssi --home=~/.config/irssi/'

# Stuff for nnn
export NNN_COLORS='#a7a8a9aa;4531'
export NNN_BMS='G:~/Documents/GU/;m:~/Games/Mods/MHWorld/;w:~/.local/share/Steam/steamapps/common/Monster Hunter World/'
export NNN_PLUG='c:fzcd;i:imgview;e:gpge;d:gpgd;p:preview-tui;f:finder'
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'
export NNN_OPTS='D'

# Shell depth indicator for nnn
[ -n "$NNNLVL" ] && PS1="N$NNNLVL $PS1"

# Stuff for MPD/MPC
export MPD_HOST="localhost"
export MPD_PORT="6600"

# Default Programs
# export EDITOR="nvim"
export EDITOR="emacsclient -t"
# export VISUAL="emacsclient -c -a emacs"
# export TERMINAL="st"
export BROWSER="firefox"
export READER="zathura"

# Fix for java programs in dwm
export _JAVA_AWT_WM_NONREPARENTING=1.

# Start ssh-agent if it isn't running
# If having issues, killall ssh-agent and
# open another terminal
function start-ssh-agent {
	if ! pgrep -u "$USER" ssh-agent > /dev/null; then
		ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env";
	fi
	if [[ ! "$SSH_AUTH_SOCK" ]]; then
		source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null;
	fi
	ssh-add
}
