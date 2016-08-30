#!/bin/bash

#choose random pic to set wall 

#directory of pics
dir="/home/mpurcell/images/wallpapers/computers"

#select random pic from dir
pic=$(ls $dir/* | shuf -n1)

#case statements to discover which image it is and
#set background in a way that looks best with that image
case $pic in
    *PDP*|*pdp*) feh --bg-max $pic;;
    #*PDP*|*pdp*) DISPLAY=:0.0 feh --bg-max $pic;;
    *TRS*) feh --bg-center $pic;;
    #*TRS*) DISPLAY=:0.0 feh --bg-center $pic;;
    *ibm1401*|*papertape*|*vax*|*apple*|*2001*) feh --bg-fill $pic;;
    #*ibm1401*|*papertape*|*vax*|*apple*|*2001*) DISPLAY=:0.0 feh --bg-fill $pic;;
    *ibm2*) feh --bg-fill --no-xinerama $pic;;
    #*ibm2*) DISPLAY=:0.0 feh --bg-fill --no-xinerama $pic;;
    *) echo "no match";;
esac

