# oh-pi-zsh
### a quick install and config deploy of the Zsh shell and the excellent addon Oh-My-Zsh for RaspPi devices running Raspbian or any Debian based distro

From your home directory:
* git clone https://github.com/JohnnyPrimus/oh-pi-zsh.git && cd oh-pi-zsh
* chmod +x setup/*.sh
* setup/pi_prereq_install.sh && setup/oh_my_zsh_install.sh
* _optionally:_ setup/pi_prereq_install.sh && setup/oh_my_zsh_install.sh
* cp -r --remove-destination setup/home/.* ~/
* sudo cp --remove-destination setup/etc/* /etc/

**Be sure to change archflags in ~/.zshrc if you are not using arm64**
