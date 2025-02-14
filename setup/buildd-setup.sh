#!/bin/bash

#install buildd and sbuild packages
sudo apt install buildd sbuild

#sbuild will be unlocked but should still have a reasonably secure password
$randpass_bbd=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 13; echo)
echo "Generated random password ${randpass_bbd} for buildd user"
$randpass_sb=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 13; echo)
echo "Generated random password ${randpass_sb} for sbuild user"
sudo usermod -p $randpass_bbd buildd
sudo usermod -p $randpass_sb sbuild
echo "Set passwords for both accounts."
#give sbuild sudo ability
echo "Adding sbuild to sudo and unlocking user."
sudo usermod -aG sudo sbuild
#unlock sbuild
sudo usermod -U sbuild

#its not clearly documented, but by default buildd expects that "upload" and "upload-security" directories be present
#in the homedir of whichever user installed them. without them it will fail with a generic message
echo "Creating upload directories in ${HOME}"
mkdir -p $HOME/upload
mkdir -p $HOME/upload-security

echo "Copying or creating updated buildd.conf to /etc/buildd/"
sudo mkdir -p /etc/buildd
sudo cp --archive -u etc/buildd/buildd.conf /etc/buildd/

#now that the config is compatible, reload buildd
echo "Complete! Restarting buildd"
sudo systemctl reload-or-restart buildd
