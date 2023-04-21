# armbian-gaming
Tool to install gaming apps on Armbian Linux/Ubuntu/Debian arm64

Beta version 0.5 : For Armbian Jammy
Might work on other Armbian versions, but no support for them.

!!!NEW Install Winetricks, see below for more info!!!
!!!NEW BUILD AND INSTALL PPSSPP and Dolphin FROM SOURCES!!!
!!!NOW ALSO POSSIBLE TO BUILD XONOTIC!!!


Download and unzip and run script : 

/bin/bash ./armbian-gaming.sh (do not use sudo or root user)


! Only install one wine version. Delete ~/wine if you want to install another version. !
Hidden ./wine will automaticaly be removed. 
I advice to use the x86 7.15 wine version. 


When installing winetricks it may get stuck at the end at : 
"0078:err:richedit:ReadStyleSheet skipping optional destination
0078:err:richedit:ReadStyleSheet skipping optional destination"
When that happens, open a 2nd terminal and type :
wineserver -k



After building Xonotic you go to the directory : 
cd ~/xonotic

To run Xonotic :
./all run

To open dolphin type :
dolphing-emu
