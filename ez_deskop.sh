#!/bin/sh
echo "This will install a desktop environment for Termux."
echo "It will take around 900mb-1gb of your space to install."
read -p "Continue? (y/n) " answer
case ${answer:0:1} in
    y|Y )
        echo "Downloading required package..."
        pkg update && pkg upgrade && pkg install x11-repo && pkg install tigervnc openbox obconf xorg-xsetroot xcompmgr xterm polybar st libnl zsh geany pcmanfm rofi feh neofetch htop vim elinks mutt git wget curl xfce4-settings
        echo "done."
        clear
        echo "Configuring..."
        cd $HOME && git clone https://github.com/adi1090x/termux-desktop
        cd termux-desktop
        cp -rf ./home /data/data/com.termux/files && cp -rf ./usr /data/data/com.termux/files
        vncserver -localhost
        export DISPLAY=":1"
        vncserver -kill :1
        clear
        echo "You can now start the desktop by typing:"
        echo "vncserver"
        echo "To stop it, type:"
        echo "vncserver -kill {display number}"
        esac
    ;;
    * )
        echo "Abort..."
    ;;
esac