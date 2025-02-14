#!/bin/bash
option=$(whiptail --title "Platform" --menu "Select your platform:" 15 50 4 \
"1" "RasbperryPi" \
"2" "x86_64 Debian" \
"3" "Exit" 3>&1 1>&2 2>&3)
clear

# Verify the selected option
case $option in
    1)
        echo "Installing RaspPi Prerequisites..."
        pi/pi_prereq_install.sh
        ;;
    2)
        echo "Install Debian Prerequisites..."
        debian/debian_prereq_install.sh
        ;;
    3)
        echo "Exiting..."
        exit 0
        ;;
    *)
        echo "Invalid option."
        ;;
esac
clear

omz=$(whiptail --title "Setup Oh-My-Zsh" --menu "Install Oh-My-Zsh?:" 15 50 4 \
"1" "Oh-My-Zsh" \
"2" "Oh-My-Zsh and Plugins" \
"3" "Exit" 3>&1 1>&2 2>&3)
clear

case $omz in
    1)
        echo "Installing Oh-My-Zsh..."
        oh-my-zsh/oh_my_zsh_install.sh
        ;;
    2)
        echo "Installing Oh-My-Zsh with Plugins..."
        oh-my-zsh/oh_my_zsh_install.sh
        oh-my-zsh/oh_my_zsh_plugins_install.sh
        oh-my-zsh/autoenv_install.sh
        ;;
    3)
        echo "Exiting..."
        exit 0
        ;;
    *)
        echo "Invalid option."
        ;;
esac


