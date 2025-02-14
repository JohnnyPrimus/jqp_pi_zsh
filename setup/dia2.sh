#!/bin/bash

items=(1 "RasberryPi Rasbian"
       2 "Debian")

while choice=$(dialog --title "$TITLE" \
                 --menu "Please select" 10 40 3 "${items[@]}" \
                 2>&1 >/dev/tty)
    do
    clear
    case $choice in
        1) /bin/bash -c pi/pi_prereq_install.sh ;;
        2) debian/debian_prereq_instal.sh ;;
        *) ;; # some action on other
    esac
done
clear # clear after user pressed Cancel
