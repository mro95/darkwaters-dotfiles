#!/bin/bash

# Set path etc.
source ~/.zshenv

# Run local .xenv
source ~/.xenv

# xset for bitmap font
xset +fp ~/.fonts
xset fp rehash

# Configure X environment
xrdb ~/.Xresources
echo 'Xft.dpi:' $PPI | xrdb -merge
urxvtd -f -o

compton --dbus &
xsetroot -cursor_name left_ptr &
xset +fp /usr/share/fonts/local/,/home/mro95/.fonts/ &
wp &
kb &
dunst &
vpsnotifyc &
urxvtd -f -o &
pulseaudio &
redshift &
