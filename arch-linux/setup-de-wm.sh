#!/bin/bash

echo "What wm/de(s) would you like to install?"
echo " Window Managers:"
echo "    Stacking: 2bwm, blackbox, enlightenment, fluxbox, gala, icewm, jwm, lwm, marco,"
echo "              metacity, muffin, mutter, openmotif, openbox, pekwm, ukwm, xfwm4"
echo "    Tiling:   bspwm, herbstluftwm, i3-wm, notion, ratpoison,stumpwm"
echo "    Dynamic:  awesome, dwm, qtile, xmonad"
echo " DE:       budgie, cinnamon, cutefish, deepin, gnome, gnome-flashback, plasma,  "
echo "           lxde, lxde-gtk3, lxqt, mate, sugar/sugar-fructose, ukui, xfce4"
echo ''
read -r -p "--> " wmde
sudo pacman -S $wmde || echo "Sorry, either you haven't set up the AUR, or the wm/de isn't available right now"
