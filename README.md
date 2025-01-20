# oh-pi-zsh
### a quick install and config deploy of the Zsh shell and the excellent addon Oh-My-Zsh for:
* RaspPi devices running Raspbian
  * follow setup instructions below 
* any Debian based distro on any arch
  * follow setup instructions below 
* Termux for Android, if:
  * you already have zsh and oh-my-zsh installed via pkg; _OR_
    * _DON'T_ run the .sh steps below, but do complete every other step
  * you're using unmodified bash (aka default install); _OR_
    * _DON'T_ run the .sh steps below, but do complete every other setup
  * youre running a Debian or Ubuntu based proot
    * follow setup instructions below (_INCLUDING_ the .sh steps) after proot'ing to your Debian/Ubuntu distro  

From your home directory:
* git clone https://github.com/JohnnyPrimus/oh-pi-zsh.git && cd oh-pi-zsh
* chmod +x setup/*.sh
* setup/pi_prereq_install.sh && setup/oh_my_zsh_install.sh
* setup/oh_my_zsh_plugin_install.sh
* cp -r --remove-destination setup/home/.* ~/
* sudo cp --remove-destination setup/etc/* /etc/

### Upcoming changes:
This started more or less as a central repo for prefs, but having used it for a while, there's not much time saved over something like scp to simply get custom prefs in place. The actual time save is in (or rather, would be in) the install and setup of the pre-reqs (oh-my-zsh, plugins, autoenv, tmux, ssh_config changes, and sometimes some tweaks for different platforms. Since this does not currently accomplish that very well, sometime soon-ish I'll consolidate the installation stuff to per-platform scripts, and create a single menu based setup.sh callable via curl stdout (a la docker, rust installations) that will do the right things automatically after offering some basic options (optional ssh configs, optional tmux)

**Be aware that ARCHFLAGS is set to (uname -m) in .zshrc. If you know that's not what you want (ex: you're always cross building), comment out the export ARCHFLAGS line in .zshrc**
