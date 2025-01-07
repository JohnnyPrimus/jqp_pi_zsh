# oh-pi-zsh
### a quick install and config deploy of the Zsh shell and the excellent addon Oh-My-Zsh for RaspPi devices running Raspbian or any Debian based distro

From your home directory:
* clone this repo
* cd <repo>
* chmod +x setup/*.sh
* "setup/pi_prereq_install.sh && setup/oh_my_zsh_install.sh"
* optionally "setup/pi_prereq_install.sh && setup/oh_my_zsh_install.sh"
* cp -r --remove-destination setup/home/.* ~/
* sudo cp --remove-destination setup/etc/* /etc/

**Be sure to change archflags in ~/.zshrc
