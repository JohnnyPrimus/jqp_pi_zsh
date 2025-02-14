#!/bin/sh
echo "Adding kali mirror to 'kali.list' under /etc/apt/sources.list.d/"
sudo sh -c "echo 'deb https://http.kali.org/kali kali-rolling main non-free contrib' > /etc/apt/sources.list.d/kali.list"

echo "Ensuring gnupg is installed..."
sudo apt install gnupg

echo "Retrieving kali repo pubkey"
wget 'https://archive.kali.org/archive-key.asc'

echo "Adding pubkey to archive-key.asc (legacy method)"
sudo apt-key add archive-key.asc

echo "Creating priority 50 pin against all kali repo packages (see below)"
sudo sh -c "echo 'Package: *'>/etc/apt/preferences.d/kali.pref; echo 'Pin: release a=kali-rolling'>>/etc/apt/preferences.d/kali.pref; echo 'Pin-Priority: 50'>>/etc/apt/preferences.d/kali.pref"

echo "Complete!"
echo ""
echo "IMPORTANT: the 'kali.prefs' file under /etc/apt/preferences.d/ sets a pin with high priority that"
echo "will prevent apt/apt-get/aptitude from considering the kali repo for depedency packages. Generally this"
echo " is a good idea (otherwise 'apt update && apt full-upgrade' would transform your entire instllation to Kali."
echo ""
echo "HOWEVER: If you intend to install metapackags like kali-tools-wireless, etc, you will likely need to adjust or temporarily"
echo "remove this pin. Do so cautiously and make sure to put it back in place when you're done installing major Kali components"
