# armbian-gaming
Tool to install gaming apps on Armbian Linux/Ubuntu/Debian arm64

Beta version 0.5 : For Armbian Hirsute and Armbian Jammy and Sid

!!!NEW BUILD AND INSTALL PPSSPP and Dolphin FROM SOURCES!!!
!!!NOW ALSO POSSIBLE TO BUILD XONOTIC!!!


Download and unzip and run script : 

/bin/bash ./armbian-gaming.sh (do not use sudo or root user)

For winex86! Not needed for wine64 Jammy/Sid. 
  Install wine x86 packages with armbian-gaming 
  Download Wine 5.13 I686 
  https://sourceforge.net/projects/wine/files/Slackware%20Packages/5.13/i686/

  Copy content of /wine-5.13-i686-1sg/usr/ folder to ~/wine/

! Only install one wine version. Delete ~/wine if you want to install another version. !
Hidden ./wine will automaticaly be removed. 


After building Xonotic you go to the directory : 
cd ~/xonotic

To run Xonotic :
./all run

To open dolphin type :
dolphing-emu
