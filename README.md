# armbian-gaming
Tool to install gaming apps on Armbian Linux/Ubuntu/Debian arm64

Beta version 0.5 : For Armbian Jammy
Might work on other Armbian versions, but no support for them.
!!!New install 
!!!NEW Install Winetricks, see below for more info!!!
!!!NEW BUILD AND INSTALL PPSSPP FROM SOURCES!!!
!!!NOW ALSO POSSIBLE TO BUILD XONOTIC!!!


Download and unzip and run script : 

/bin/bash ./armbian-gaming.sh (do not use sudo or root user)


! Only install one wine version. Delete ~/wine if you want to install another version. !
Hidden ./wine will automaticaly be removed. 
I advice to use the x86 7.15 wine version. 
If you want to download another version. Put the "bin, "lib" and "share" folders into ~/wine
And run "wine winecfg"

When installing winetricks it may get stuck at the end at : 

"0078:err:richedit:ReadStyleSheet skipping optional destination
0078:err:richedit:ReadStyleSheet skipping optional destination"

When that happens, open a 2nd terminal and type : 
  wineserver -k


After building Xonotic you go to the directory : 
  cd ~/xonotic

To run Xonotic :
  ./all run

To use Malior-droid :
  adb connect localhost:5555
  scrcpy -s localhost:5555

If Malior-droid doesn't work use this :
  malior-droid stop
  malior-droid start

To open dolphin type :  (removed dolphin for now until I can fix it)
dolphing-emu
Dolphin has a bug I need to fix. If anyone knows the fix, let me know.

Thanks to, in no perticular order : Salva (YT MicroLinux), PtitSeb (creator of Box86/64 OpenGles ...), MonkaBlyat (Linux guru who helped with Winetricks and Mailor-droid), ChisBread, DarkevilPT, RPardini, and all other who helped.
