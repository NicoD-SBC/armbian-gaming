#!/bin/bash

function menu {
echo "Hello. Please choose what you want to install ! "
echo "1. Install all "
echo "2. Install Box86 "
echo "3. Install Box64 "
echo "4. Install Wine x86 "
echo "5. Install dependencies for N2/N2+ before Box86 install "
echo "6. Exit armbian-gaming "

read choicevar

if [ $choicevar -eq 1 ]
	then 
	all
elif [ $choicevar -eq 2 ]
	then 
	box86
elif [ $choicevar -eq 3 ]
	then 
	box64
elif [ $choicevar -eq 4 ]
	then 
	winex86
elif [ $choicevar -eq 5 ]
	then 
	depN2
elif [ $choicevar -eq 6 ]
	then
	echo "Greetings, NicoD "
	exit
else 
	echo "Invalid choice. "
fi
}

function depN2 {
	sudo apt install libavutil56:armhf libswresample3:armhf libavutil56:armhf libchromaprint1:armhf libavutil56:armhf libvdpau1:armhf
}

function winex86 {
	sudo cp wine /usr/local/bin/
	sudo chmod +x /usr/local/bin/wine
	echo "Copied wine to /usr/local/bin/ and given rights "
	
	sudo cp wineserver /usr/local/bin/
	sudo chmod +x /usr/local/bin/wineserver
	echo "Copied wineserver to /usr/local/bin/ and given rights "

	
	sudo cp winetricks /usr/local/bin/
	sudo chmod +x /usr/local/bin/winetricks
	echo "Copied winetricks to /usr/local/bin/ and given rights "

	cp wine-config.desktop ~/.local/share/applications/
	cp wine-desktop.desktop ~/.local/share/applications/
	echo "Copied wine-config.desktop and wine-desktop.desktop to ~/.local/share/applications/ "
	echo " "
	
	mkdir ~/wine/
	mkdir ~/wine/lib/
	cp libwine.so ~/wine/lib/
	cp libwine.so.1 ~/wine/lib/
	echo "Created wine folder and copied libwine.so and libwine.so.1 "
	echo " "
	
	echo "Download Wine 5.13 I686 https://sourceforge.net/projects/wine/files/Slackware%20Packages/5.13/i686/ "
     	echo "Copy content of /wine-5.13-i686-1sg/usr/ folder to ~/wine/ "

}


function update {
	sudo apt -y update && apt -y upgrade
}

function box86 {
	sudo dpkg --add-architecture armhf
	update
	dependencies
	git clone https://github.com/ptitSeb/box86.git	
	cd box86/
	mkdir build
	cd build
	sudo cmake .. -DRK3399=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo
	sudo make -j4
	sudo make install
	cd ..
	cd ..
}

function dependencies {	
#Install dependencies
	sudo apt -y install libllvm12:armhf
	sudo apt -y install linux-libc-dev:armhf
	sudo apt -y install git cmake libncurses6:armhf libc6:armhf  libx11-6:armhf libgdk-pixbuf2.0-0:armhf libgtk2.0-0:armhf libstdc++6:armhf libsdl2-2.0-0:armhf mesa-va-drivers:armhf libsdl1.2-dev:armhf libsdl-mixer1.2:armhf libpng16-16:armhf libcal3d12v5:armhf libsdl2-net-2.0-0:armhf libopenal1:armhf libsdl2-image-2.0-0:armhf libvorbis-dev:armhf libcurl4:armhf libjpeg62:armhf  libudev1:armhf libgl1-mesa-dev:armhf  libx11-dev:armhf libsmpeg0:armhf libavcodec58:armhf libavformat58:armhf libswscale5:armhf libsdl2-image-2.0-0:armhf libsdl2-mixer-2.0-0:armhf gcc-arm-linux-gnueabihf cmake git cabextract
	dependenciesFix
}

function dependenciesFix {
	 sudo mv /usr/share/doc/linux-libc-dev/changelog.Debian.gz /usr/share/doc/linux-libc-dev/changelog.Debian.gz.old 
	 sudo rm /usr/include/drm/drm_fourcc.h
	 sudo rm /usr/include/drm/lima_drm.h
	 sudo apt -y --fix-broken install
}

function box64 {
	git clone https://github.com/ptitSeb/box64
	cd box64
	mkdir build
	cd build
	sudo apt -y install linux-libc-dev
	sudo apt -y install build-essential 
	sudo cmake .. -DRK3399=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo
	sudo make -j4
	sudo make install
	cd ..
	cd ..
}

function all {
	box86
	box64
	winex86
}

 

menu
echo "Greetings, NicoD "
