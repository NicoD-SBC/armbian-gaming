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
	sudo cp wineserver /usr/local/bin/
	sudo cp winetricks /usr/local/bin/
	cp wine-config.desktop ~/.local/share/applications/
	cp wine-desktop.desktop ~/.local/share/applications/
	echo "Download wine x86 at sourceforge and place it in ~/home/ "
	echo "https://sourceforge.net/projects/wine/files/Slackware%20Packages/"
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
	cmake .. -DRK3399=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo
	make -j4
	sudo make install
	cd ..
	cd ..
}

function all {
	box86
	box64
}

 

menu
echo "Greetings, NicoD "
