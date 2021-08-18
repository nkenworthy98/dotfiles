
# Starting programs
xwallpaper --zoom "$HOME/.config/wallpaper.jpg" &
picom &
[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources
emacs --daemon &
slstatus &
sxhkd &
dunst &
mpd &
start-pulseaudio-x11 &
# python /home/nick/.otherPrograms/searx/searx/webapp.py &
light -S 10 &

# Graphical programs
st -e 'xinit-tmux.sh'&
# emacsclient -c &
# tor-browser &


# This starts dwm and various programs 
exec dwm

# This starts kde
# exec startplasma-x11
