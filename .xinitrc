
# Starting programs
xwallpaper --zoom "$HOME/.config/wallpaper.jpg" &
picom &
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
emacs --daemon &
sxhkd &
dunst &
mpd &
start-pulseaudio-x11 &
setb.pl 10 &
clipnotify.sh &

# Graphical programs
# st -e 'xinit-tmux.sh' &
# emacsclient -c &
# tor-browser &


# This starts dwm and various programs
# slstatus &
# exec dwm

# This starts kde
# exec startplasma-x11

exec bspwm
