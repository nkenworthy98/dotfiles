# If you come from bash you might have to change your $PATH.
export PATH="$PATH:$HOME/bin:$HOME/bin/perl_scripts:$HOME/bin/ocr-scripts:$HOME/bin/tmr-scripts:/usr/local/bin:$HOME/.local/bin"

# Path to your oh-my-zsh installation.
# export ZSH="/home/nick/.oh-my-zsh"
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="random"
export MAIN_CUSTOM_COLOR='#2d6580'
PROMPT='%B%F{magenta}[%F{$MAIN_CUSTOM_COLOR}%n%f%F{$MAIN_CUSTOM_COLOR}@%F{$MAIN_CUSTOM_COLOR}%m%f %F{cyan}%B%c%F{magenta}]%b%f%# '

# This is needed in order for TRAMP to work
# This needs to be in the remote machine's shell rc file
[[ $TERM == "dumb" ]] && unsetopt zle && PS1='$ '

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git 
	vi-mode 
	colored-man-pages
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias em='emacs -nw'
alias yv='pipe-viewer -360'
alias pm='pulsemixer'
alias backg='xrandr --auto; xwallpaper --zoom $HOME/.config/wallpaper.jpg'
alias nb='newsboat'
alias wa='torsocks w3m archlinux.org'
alias wd='torsocks w3m duckduckgo.com'
alias pacman-remove-dependencies='sudo pacman -Rs $(pacman -Qqtd)'
alias convert-md-to-org='find . -name "*.md" | while read i; do pandoc -f markdown -t org "$i" -o "${i%.*}.org"; done'
alias tuir='tuir -s livestreamfail'

# Use for dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Aliases to change where config files should be,
# which should be in the .config directory
alias irssi='irssi --home=~/.config/irssi/'

# Stuff for nnn
export NNN_COLORS='4531'
export NNN_BMS='G:~/Documents/GU/;m:~/Games/Mods/MHWorld/;w:~/.local/share/Steam/steamapps/common/Monster Hunter World/'
export NNN_PLUG='c:fzcd;i:imgview;e:gpge;d:gpgd;p:preview-tui;f:finder'
export NNN_FIFO='/tmp/nnn.fifo'
export NNN_FCOLORS='c1e2272e006033f7c6d6abc4'

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
