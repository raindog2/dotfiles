#!/bin/bash
# autostart script for awesome
# need to discover a way to have this run
# at awesome's startup

#These are taken care of by lightdm now, so they are commented out
#make AOC the primary screen, screen [1] to awesome
#(sleep 6s && xrandr --output HDMI-0 --primary) &
xrandr --output HDMI-0 --primary &

#These are taken care of by lightdm now, so they are commented out
#set up monitors
(sleep 1s && xrandr --output HDMI-0 --mode 1920x1080) &
(sleep 2s && xrandr --output VGA-0 --mode 1280x1024 --right-of HDMI-0) &

#These are taken care of by lightdm now, so they are commented out
#Get external mouse working
xinput --set-prop "12" "Device Accel Constant Deceleration" 2 &

###KEYBOARD###

#next 5 lines not needed, handled by /etc/default/keyboard
#setxkbmap us -variant colemak &
#(sleep 2s && xmodmap -e "keycode 9 = Caps_Lock") &
#(sleep 2s && xmodmap -e "keycode 66 = Escape") & 
#(sleep 1s && /usr/bin/xmodmap /home/mpurcell/.swap_capslock_esc) &
#(sleep 2s && setxkbmap -option caps:swapescape) &
(sleep 4s && xmodmap -e "keycode 108 = Alt_L") & 

#colemak already adjusted in /usr/share/X11/xkb/symbols/us-colemak-adjusted file
#(sleep 4s && ~/bin/colemakadjusted.sh) &

#Check if thunar daemon is running and start it if it is not already running
#process="thunar"
#command="thunar --daemon"

#status=$(pgrep -c "$process")

#if [ "$status" -ne 0 ] ; then 
  #echo "hi" > /dev/null &
#else
  #$command &
#fi

#start pulseaudio
(sleep 1s &&
process="pulseaudio"
command="pulseaudio"

status=$(pgrep -c "$process")

if [ "$status" -ne 0 ] ; then 
  echo "hi" > /dev/null &
else
  "$command" &
fi) &

#volume icon in the systray
(sleep 3s &&
process="volumeicon"
command="volumeicon"

status=$(pgrep -c "$process")

if [ "$status" -ne 0 ] ; then 
  echo "hi" > /dev/null &
else
  "$command" &
fi) &

####XSETS#####

#turn off system beep
(sleep 1s && xset b off) &

#set screen auto sleep
(sleep 1s && xset s 600 600) &
(sleep 1s && xset -dpms) &

#turn on numberlock (slim does this already)
(sleep 1s && numlockx on) &


## Set keyboard settings - 255 ms delay before repeat and 45 cps (characters per second) repeat rate.
(sleep 1s && xset r rate 255 45) &

# Map Menu Key to Right Super Key
(sleep 1s && xmodmap -e "keycode 135 = Super_L") &

# Start the network manager applet in the tray if it is not already running
#(sleep 2s &&
#process="nm-applet"
#command="nm-applet"

#status=$(pgrep -c "$process")

#if [ "$status" -ne 0 ] ; then 
  #echo "hi" > /dev/null &
#else
    #$command &
#fi) &

# Start the wicd client minimized in the tray if it is not already running
(sleep 3s &&
process="wicd-client"
command="wicd-client --tray"

status=$(pgrep -c "$process")

if [ "$status" -ne 0 ] ; then 
  echo "hi" > /dev/null &
else
    $command &
fi)

#Compositor for transparency 
#(sleep 2s && compton) &

#start xfce power manager if it is not already running
#(sleep 2s &&
#process="xfce4-power-manager"
#command="xfce4-power-manager"

#status=$(pgrep -c "$process")

#if [ "$status" -ne 0 ] ; then 
  #echo "hi" > /dev/null &
#else
  #"$command" &
#fi) &

#Other look-and-feel
#(sleep 6s && conky -c .conky/zenburn/conkyrc) &

#Set Wallpaper to what it had been at last logout
(sleep 3s && nitrogen --restore) &

# Start conky if it is not already running
#(sleep 6s &&
#process="conky"
#command="conky -c .conky/snow/conkyrc"

#status=$(pgrep -c "$process")

#if [ "$status" -ne 0 ] ; then 
  #echo "hi" > /dev/null &
#else
    #$command &
#fi)

#Start HTOP if it is not running
(sleep 4s &&
process="htop"
command="xfce4-terminal -T htop --command='/usr/bin/htop'"

status=$(pgrep -c "$process")

if [ "$status" -ne 0 ] ; then 
  echo "hi" > /dev/null &
else
  $command &
fi) &

# Start syncthing if it is not already running
(sleep 3s &&
process="syncthing"
command="syncthing -no-browser"

status=$(pgrep -c "$process")

if [ "$status" -ne 0 ] ; then 
  echo "hi" > /dev/null &
else
    $command &
fi) &

###EOF###
