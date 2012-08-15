#!/bin/bash
 
#enable ctrl-alt-bkspc
setxkbmap -option terminate:ctrl_alt_bksp

# Load resources

trayer --edge top --align right --SetDockType true --SetPartialStrut true --expand true --width 5 --height 18 --transparent true --tint 0x000000 & --alpha 0

#gnome-screensaver

#gnome-settings-daemon

#gnome-power-manager &

if [ -x /usr/bin/nm-applet ] ; then
   nm-applet --sm-disable &
fi

kmix --keepvisibility

feh --bg-scale ~/Pictures/Electronic_art.jpg & 

 
exec xmonad
