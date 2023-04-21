#!/bin/bash


function menuJammy {
echo "Please choose what you want to install! "
echo "1. Install libglu1-mesa for Box64 on Jammy and Sid. "
echo "2. Install/Update Box64. "
echo "3. Install/update box86. "
echo "4. Install wine 64 files. "
echo "5. Install wine x86 files. "
echo "6. Install winetricks. "
echo "7. Build and install PPSSPP. "
echo "8. Build and install Dolphin emulator. "
echo "9. Build Xonotic. "
echo "10. Exit "

read choicevar
if [ $choicevar -eq 1 ]
	then 
	libglu
elif [ $choicevar -eq 2 ]
	then 
	box64
elif [ $choicevar -eq 3 ]
	then 
	box86
elif [ $choicevar -eq 4 ]
	then 
	wine64
elif [ $choicevar -eq 5 ]
	then 
	winex86
elif [ $choicevar -eq 6 ]
	then 
	winetricksInstall
elif [ $choicevar -eq 7 ]
	then 
	installPPSSPP
elif [ $choicevar -eq 8 ]
	then 
	buildDolphin
elif [ $choicevar -eq 9 ]
	then 
	buildXonotic
elif [ $choicevar -eq 10 ]
	then
	echo "Greetings, NicoD "
	exit
else 
	echo "Invalid choice. "
fi
}

function buildXonotic {
	cd ~
	sudo apt-get -y install autoconf automake build-essential curl git libtool libgmp-dev libjpeg-turbo8-dev libsdl2-dev libxpm-dev xserver-xorg-dev zlib1g-dev unzip zip
	git clone https://gitlab.com/xonotic/xonotic.git  # download main repo
	cd xonotic
	./all update -l best
	./all compile -r
	echo "Xonotic is compiled. Start with ./all run. "
}

function buildDolphin {
	sudo apt -y install --no-install-recommends git ca-certificates qtbase5-dev qtbase5-private-dev git cmake make gcc g++ pkg-config libavcodec-dev libavformat-dev libavutil-dev libswscale-dev libxi-dev libxrandr-dev libudev-dev libevdev-dev libsfml-dev libminiupnpc-dev libmbedtls-dev libcurl4-openssl-dev libhidapi-dev libsystemd-dev libbluetooth-dev libasound2-dev libpulse-dev libpugixml-dev libbz2-dev libzstd-dev liblzo2-dev libpng-dev libusb-1.0-0-dev gettext
	git clone https://github.com/dolphin-emu/dolphin.git dolphin-emu
	cd ./dolphin-emu
	git submodule update --init --recursive
	mkdir Build && cd Build
	cmake ..
	make -j$(nproc)
	sudo make install
}
function winetricksInstall {
	cd ~
	sudo dpkg --add-architecture armhf
	sudo apt update
	sudo apt install libxinerama-dev:armhf libxrandr-dev:armhf libxcomposite-dev:armhf libxi-dev:armhf libxcursor-dev:armhf mesa-va-drivers:armhf libc6:armhf libx11-6:armhf libgdk-pixbuf2.0-0:armhf libgl1-mesa-dev:armhf
	libavcodec58:armhf libavformat58:armhf libpng16-16:armhf libcal3d12v5:armhf libopenal1:armhf libvorbis-dev:armhf libcurl4:armhf osspd:armhf libjpeg62:armhf libudev1:armhf libsnappy1v5:armhf
	libsmpeg0:armhf libmyguiengine3debian1v5:armhf libqt5core5a:armhf 
	assuming downloaded wine in /home/wine
	sudo ln -s ~/wine/bin/wine /usr/local/bin/wine
	sudo ln -s ~/wine/bin/winecfg /usr/local/bin/winecfg
	sudo ln -s ~/wine/bin/wineserver /usr/local/bin/wineserver
	wget https://raw.githubusercontent.com/Winetricks/winetricks/master/src/winetricks
	sudo chmod +x winetricks
	sudo cp winetricks /usr/local/bin
	sudo apt install cabextract -y
	BOX86_NOBANNER=1 winetricks dotnet20sp2
	BOX86_NOBANNER=1 winetricks corefonts
	BOX86_NOBANNER=1 winetricks d3dx9
	BOX86_NOBANNER=1 winetricks quartz
	BOX86_NOBANNER=1 winetricks mfc42
	BOX86_NOBANNER=1 winetricks msxml4
	BOX86_NOBANNER=1 winetricks cnc_ddraw
	menuJammy
}

function installPPSSPP {
	cd ~
	git clone --recurse-submodules https://github.com/hrydgard/ppsspp.git
	cd ppsspp
	git pull --rebase https://github.com/hrydgard/ppsspp.git
	git submodule update --init --recursive
	sudo apt -y install build-essential cmake libgl1-mesa-dev libsdl2-dev libvulkan-dev
	/bin/bash ./b.sh
	cd build
	make
	sudo make install
}


function depN2 {
	sudo apt install libavutil56:armhf libswresample3:armhf libavutil56:armhf libchromaprint1:armhf libavutil56:armhf libvdpau1:armhf
}



function winex86 {
	
	sudo rm /usr/local/bin/wine
	sudo rm /usr/local/bin/wine64
	sudo rm /usr/local/bin/wineserver
	sudo rm /usr/local/bin/winecfg
	sudo rm /usr/local/bin/wineboot
	sudo rm -r ~/.wine/
	sudo rm -r ~/wine/
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
	
	cd ~/wine/
	wget https://github.com/Kron4ek/Wine-Builds/releases/download/7.15/wine-7.15-x86.tar.xz
	sudo apt -y install xz-utils tar
	xz -d wine-7.15-x86.tar.xz
	tar -xf wine-7.15-x86.tar
	cd wine-7.15-x86/
	cp -R * ~/wine
	sudo ln -s ~/wine/bin/wine /usr/local/bin/wine
	sudo ln -s ~/wine/bin/winecfg /usr/local/bin/winecfg
	sudo ln -s ~/wine/bin/wineserver /usr/local/bin/wineserver

}

function wine64 {
	sudo rm -r ~/.wine/
	sudo rm -r ~/wine/
	cd ~
	wget https://www.playonlinux.com/wine/binaries/phoenicis/upstream-linux-amd64/PlayOnLinux-wine-6.0.1-upstream-linux-amd64.tar.gz
	mkdir ~/wine
	cd ~/wine
	tar xf ../PlayOnLinux-wine-6.0.1-upstream-linux-amd64.tar.gz
	sudo rm /usr/local/bin/wine
	sudo rm /usr/local/bin/wine64
	sudo rm /usr/local/bin/wineserver
	sudo rm /usr/local/bin/winecfg
	sudo rm /usr/local/bin/wineboot
	sudo ln -s ~/wine/bin/wine /usr/local/bin/wine
	sudo ln -s ~/wine/bin/wine64 /usr/local/bin/wine64
	sudo ln -s ~/wine/bin/wineserver /usr/local/bin/wineserver
	sudo ln -s ~/wine/bin/winecfg /usr/local/bin/winecfg
	sudo ln -s ~/wine/bin/wineboot /usr/local/bin/wineboot
	cd ..
	sudo rm PlayOnLinux-wine-6.0.1-upstream-linux-amd64.tar.gz
	echo "Wine installed, test with : "
	echo "box64 wine winecfg "
}

function update {
	sudo apt -y update && apt -y upgrade
}

function box86 {
	sudo apt -y install libc6-dev-armhf-cross git cmake gcc-arm-linux-gnueabihf 
	cd ~
	git clone https://github.com/ptitSeb/box86
	cd box86
	chooseBoard
	make -j2
	sudo make install
	sudo systemctl restart systemd-binfmt

	sudo dpkg --add-architecture armhf
	sudo apt update
	sudo aptitude install mesa-va-drivers:armhf libgtk2.0-0:armhf libsdl2-image-2.0-0:armhf libsdl1.2debian:armhf libopenal1:armhf libvorbisfile3:armhf libgl1:armhf libjpeg62:armhf libcurl4:armhf libasound2-plugins:armhf -y
	sudo apt update
	sudo aptitude upgrade
	menuJammy
}

function dependencies {	
	sudo apt -y install libllvm12:armhf
	sudo apt -y install linux-libc-dev:armhf
	sudo apt -y install git cmake mpg123 mpg123:armhf libncurses6:armhf libc6:armhf  libx11-6:armhf libgdk-pixbuf2.0-0:armhf libgtk2.0-0:armhf libstdc++6:armhf libsdl2-2.0-0:armhf mesa-va-drivers:armhf libsdl1.2-dev:armhf libsdl-mixer1.2:armhf libpng16-16:armhf libcal3d12v5:armhf libsdl2-net-2.0-0:armhf libopenal1:armhf libsdl2-image-2.0-0:armhf libvorbis-dev:armhf libcurl4:armhf libjpeg62:armhf  libudev1:armhf libgl1-mesa-dev:armhf  libx11-dev:armhf libsmpeg0:armhf libavcodec58:armhf libavformat58:armhf libswscale5:armhf libsdl2-image-2.0-0:armhf libsdl2-mixer-2.0-0:armhf gcc-arm-linux-gnueabihf cmake git cabextract
	dependenciesFix
}

function dependenciesFix {
	 sudo mv /usr/share/doc/linux-libc-dev/changelog.Debian.gz /usr/share/doc/linux-libc-dev/changelog.Debian.gz.old 
	 sudo rm /usr/include/drm/drm_fourcc.h
	 sudo rm /usr/include/drm/lima_drm.h
	 sudo apt -y --fix-broken install
}


function chooseBoard {
echo "Please choose what you want to install! "
echo "1. RK3399 "
echo "2. RK3588(S). "
echo "3. Odroid N2(+) "
echo "4. Raspberry Pi 3(A/B/+). "
echo "5. Raspberry Pi 4(400). "
echo "6. Other ARM64 "
echo "7. Exit "

read boardchoicevar
if [ $boardchoicevar -eq 1 ]
	then 
	rk3399
elif [ $boardchoicevar -eq 2 ]
	then 
	rk3588
elif [ $boardchoicevar -eq 3 ]
	then 
	N2
elif [ $boardchoicevar -eq 4 ]
	then 
	rpi3
elif [ $boardchoicevar -eq 5 ]
	then 
	rpi4
elif [ $boardchoicevar -eq 6 ]
	then 
	other
elif [ $boardchoicevar -eq 7 ]
	then
	echo "Greetings, NicoD "
	exit
else 
	echo "Invalid choice. "
fi
}

function other {
	mkdir build 
	cd build 
	sudo apt -y install cmake
	cmake .. -DLARCH64=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo
}

function rpi4 {
	mkdir build 
	cd build 
	sudo apt -y install cmake
	cmake .. -DRPI4ARM64=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo
}

function rpi3 {
	mkdir build 
	cd build 
	sudo apt -y install cmake
	cmake .. -DRPI3ARM64=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo
}

function N2 {
	mkdir build 
	cd build 
	sudo apt -y install cmake
	cmake .. -DODROIDN2=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo
}

function rk3588 {
	mkdir build 
	cd build 
	sudo apt -y install cmake
	cmake .. -DRK3588=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo
}

function rk3399 {
	mkdir build 
	cd build 
	sudo apt -y install cmake
	cmake .. -DRK3399=1 -DCMAKE_BUILD_TYPE=RelWithDebInfo
}


function box64 {
    cd ~
    git clone https://github.com/ptitSeb/box64
    cd box64
    chooseBoard
    make -j4
    sudo make install
    menuJammy
}



function libglu {
	sudo apt -y install libglu1-mesa 
	menuJammy
}

function distro {
	menuJammy
}

distro
echo "Greetings, NicoD "
