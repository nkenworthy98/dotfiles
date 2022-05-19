
# Starting programs
xwallpaper --zoom ~/.config/wallpaper.jpg &
picom &
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
emacs --daemon &
sxhkd &
dunst &
mpd &
start-pulseaudio-x11 &
setb.pl 10 &
clipnotify.sh &

# Graphical Programs
# emacs &
# tor-browser &
st -e 'tmux-main.sh' -n 'tmux-main' &
st -e 'tmux-sec.sh' -n 'tmux-sec' &
# steam &


# This starts dwm and various programs
# slstatus &
# exec dwm

# This starts kde
# exec startplasma-x11

exec bspwm
