#!/bin/bash
## Code from adi1090! Thx!. Without him, i can't create this!
apt install -y figlet screenfetch
screenfetch>nul
clear
figlet -c       EZ_TERMUX_DESKTOP
echo
echo "This will install a desktop environment for Termux."
echo "It will take around 900mb-1gb of your space to install."
echo
read -p "Continue? (y/n) " answer
case ${answer:0:1} in
    y|Y )
        screenfetch>nul
        clear
        echo "downloading required files..."
        pkg update && pkg upgrade && pkg install -y x11-repo && pkg install -y tigervnc openbox obconf xorg-xsetroot xcompmgr xterm polybar st libnl zsh geany pcmanfm rofi feh neofetch htop vim elinks mutt git wget curl xfce4-settings
        figlet -c DONE.
        screenfetch>nul
        clear
        echo "Configuring..."
        cd $HOME && git clone https://github.com/adi1090x/termux-desktop
        cd termux-desktop
        cp -rf ./home /data/data/com.termux/files && cp -rf ./usr /data/data/com.termux/files
        vncserver -localhost
        export DISPLAY=":1"
        vncserver -kill :1
        screenfetch>nul
        clear
        figlet -c  Congratulations!
        echo "  Ez_Termux_Desktop"
        echo " Have been installed successfully on this device"
        echo
        echo "You can now access them by typing:"
        echo "vncserver"
        echo
        echo "To stop the server, type:"
        echo "vncserver -kill {Display Number}"
        echo
    ;;
    * )
        screenfetch>nul
        clear
        figlet -c WHY DID YOU DO THIS TO ME?!??!
        echo "Abort..."
    ;;
esac
