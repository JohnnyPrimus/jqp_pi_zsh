#!/bin/bash
clear

ARCHFLAGS=$(uname -m)
PLATFORM=""
INSTTYPE=""
KALIREPO="no"
PLAT_MSG=""
TYPE_MSG=""
SKIP_TO_OPT=false
OPTIONALS_MSG=""
clear

inst_platform_menu=$(cat <<'EOF'
+-----------------------------------+
| 1.) Raspberry Pi                  |
| 2.) Debian/Ubuntu                 |
| 3.) Termux                        |
|                                   |
| 4.) Quit                          |
+-----------------------------------+

Select the platform this installer is currently running on.

Note: "Debian/Ubuntu" may work for other Deb based distributions,
but minor configuration changes may be necessary.

Select Platform [1/2/3 or 4 to quit]:
EOF
)

function install_platform() {
    read -rep "$inst_platform_menu" selection
    case $selection in
      1) PLAT_MSG="Using Rasbpian ${ARCHFLAGS} packages"
      break
      ;;
      2) PLAT_MSG="Using Debian ${ARCHFLAGS} packages"
      break
      ;;
      3) PLAT_MSG="Using Termux pkg with defualt architecture"
      break
      ;;
      4) clear && exit 0;;
    esac
}

install_platform

clear

echo ${PLAT_MSG}

sleep 5

clear

inst_type_menu=$(cat <<'EOF'
+-------------------------------------------------------+
| 1.) Minimal Install                                   |
| 2.) Complete Install w/ Plugins                       |
| 3.) Full Install w/ Extras                            |
| 4.) Skip installations, show optional downloads only  |
|                                                       |
| 5.) Quit                                              |
+-------------------------------------------------------+

Minimal: Installs only the packages necessary to get ZSH
and oh-my-zsh up and running on TTY/SSH, and includes only
the plugins defult oh-my-zsh plugins

Complete: Performs the minimal install, then installs AutoEnv
and a few additional community plugins and configure everything

Full/Extra: Complete installation but the includes '--install-suggests'
durig apt-get package installations. This means that any additional packages
the authors listed as 'suggested' (generally this means things like GTK libs,
dev libs and includes, docs, and any related GUI apps. If no window manager
is installed, it would also install X11 as a depedency). Full installation
is substantially larger (up to a few GB)

Skip Installations: Select skip if you've already run this script, and want to 
jump straight to (or revisit) the optional direct download/installs of Rust, etc

**If you're not sure, choose 2 (Complete)**

Install Type Selection:
EOF
)

function install_type() {
    read -rep "$inst_type_menu" selection
    case $selection in
      1) TYPE_MSG="Proceeding with minimal installation..."
      break
      ;;
      2) TYPE_MSG="Performing complete installation..."
      break
      ;;
      3) TYPE_MSG="Performing complete installation with all available extras..."
      break
      ;;
      4) SKIP_TO_OPT=true
      TYPE_MSG="Proceeding to optional downloads..."
      break
      ;;
      5) clear && exit 0;;
    esac
}

install_type

clear

echo ${TYPE_MSG}

if [ "$SKIP_TO_OPT" = true ]; then
  echo "Blasting some downloads"
fi

sleep 5
clear

optional_downloads_menu=$(cat <<'EOF'
Optional Direct Downloads and Installs:

Generally speaking, the latest stable pakages available on the RaspberryPi,
Debian and Ubuntu repos will work great for as long as the distribution is
maintained (examples: python3.12 w/ pip3, perl 5.x). Likewise the repos will
almost always have the package/app/service you want. There are some exceptions
to the rule though, where the version of a package on the Debian/RPI repos may
limit your ability to install or build newly released apps...

Rust and Docker are the two most relevant examples, but this list may grow over
time.

I have found it generally worth while to download, build and install the latest
versions of these directly from developers git repos or websites.

This setup script supports downloading and building the latest versions of a
small number of apps/languages directly (meaning they are not handled by apt/yum/pkg).

Do you want to select any packages to download directly and install the latest released 
version?


+--------------------------------------------------------+
| 1.) Yes, show avaialble direct installations           |
| 2.) No, the package manager shoud handle all packages  |
+--------------------------------------------------------+

Selection: [1/2]:
EOF
)

OPTIONALS_SLEEP=5
function optional_downloads() {
    read -rep "$optional_downloads_menu" selection
    case $selection in
      1) OPTIONALS_MSG="The next few pages will show available direct latest-version installs"
      break
      ;;
      2) OPTIONALS_SLEEP=10 
      OPTIONALS_MSG=$(cat << 'EOF'
We'll use apt for all package management. You can run this script again anytime 
and select "skip to optional downloads" if you want to install direct releases
in the future.

Note: if you do re-run the script again in the future for any optional installs,
you should make sure to run "git pull" prior to running setup.sh, as new pacakges
are added or install processes are occasionally updated.
EOF
)
      break
      ;;
    esac
}

optional_downloads

clear

echo ${OPTIONALS_MSG}

sleep $OPTIONALS_SLEEP

exit 0

PS3="Add Kali-Linux apt package source? (Choose no unless you are certain you want a component not from Kali not available in Debian/Raspbian)"
select OMZ_KALI_REPO in No Yes
do
    case $OMZ_KALI_REPO in
        "No")
            KALIREPO="no"
            break;;
        "Yes")
            KALIREPO="yes"
            break;;
    esac
done
clear

PS3="Install latest Rust/Cargo via HTTP?"
select OMZ_RUST_INST in No Yes
do
    case $OMZ_RUST_INST in
        "No")
            RUSTINST="no"
            break;;
        "Yes")
            RUSTINST="yes"
            break;;
    esac
done
clear

PS3="Install nano editor customizations?"
select OMZ_NANO_INST in No Yes
do
    case $OMZ_NANO_INST in
        "No")
            NANOINST="no"
            break;;
        "Yes")
            NANOINST="yes"
            break;;
    esac
done

exit 1
