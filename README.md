# oh-pi-zsh
### a quick install and config deploy of the Zsh shell and the excellent addon Oh-My-Zsh for:
* RaspPi devices running Raspbian
  * follow setup instructions below 
* any Debian based distro on any arch
  * follow setup instructions below 
* Termux for Android, if:
  * you already have zsh and oh-my-zsh installed via pkg
    * _DON'T_ run the .sh steps below, but do complete every other step
  * you're using unmodified bash (aka default install)
    * _DON'T_ run the .sh steps below, but do complete every other setup
  * youre running a Debian or Ubuntu based proot
    * follow setup instructions below (_INCLUDING_ the .sh steps) your Debian/Ubuntu proot distro  

From your home directory:
* git clone https://github.com/JohnnyPrimus/oh-pi-zsh.git && cd oh-pi-zsh
* chmod +x setup/*.sh
* setup/pi_prereq_install.sh && setup/oh_my_zsh_install.sh
* setup/oh_my_zsh_plugin_install.sh
* cp -r --remove-destination setup/home/.* ~/
* sudo cp --remove-destination setup/etc/* /etc/

**Be aware that ARCHFLAGS is set to (uname -m) in .zshrc. If you know that's not what you want (ex: you're always cross building), comment out the export ARCHFLAGS line in .zshrc**
