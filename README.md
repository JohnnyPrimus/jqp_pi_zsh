# oh-pi-zsh
### a quick install and config deploy of the Zsh shell and the excellent addon Oh-My-Zsh for RaspPi devices running Raspbian or any Debian based distro (also deployable to Termux if youre running a proot _or_ have zsh and oh-my-zsh installed _or_ are using bash (default install). Skip all .sh steps for default termux installs (include them for proots))

From your home directory:
* git clone https://github.com/JohnnyPrimus/oh-pi-zsh.git && cd oh-pi-zsh
* chmod +x setup/*.sh
* setup/pi_prereq_install.sh && setup/oh_my_zsh_install.sh
* setup/oh_my_zsh_plugin_install.sh
* cp -r --remove-destination setup/home/.* ~/
* sudo cp --remove-destination setup/etc/* /etc/

**Be sure to change archflags in ~/.zshrc if you want something other than (uname -m) as default**
