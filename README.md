# armbian-gaming  
Tool to install gaming apps on Armbian Linux/Ubuntu/Debian arm64  

Armbian-gaming version 1.0 : For Armbian Jammy   
Might work on other Armbian versions, but no support for them.  

This script can install :  
  1. Install/Update Box64.  
  2. Install/update box86.  
  3. Install wine 64 files. Updated to version 8.16. No need for box86 for x86 games/wine.
  4. Install wine x86 files.  
  5. Install winetricks.  
  6. Install steam.  
  7. Build and install PPSSPP.  
  8. Install Malior-droid Android emulator.  
  9. Build Duckstation PS1 emulator.  
  10. Download Aethersx2 PS2 emulator.  
  11. Build Xonotic.  

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

For the Steam installer from PtitSeb you need Box86 and the Box86 compilation folder. After install you can delete ~/box86 + ~/box64 to save space.  

To open PPSSPP type in terminal :
PPSSPPSDL

To use Malior-droid :  
  adb connect localhost:5555  
  scrcpy -s localhost:5555  
  
If Malior-droid doesn't work use this :  
  malior-droid stop  
  malior-droid start  
  
Use duckstation by browsing to folder with terminal :  
cd ~/duckstation/build-release/bin  
Open with :  
./duckstation-qt  
 
To use Aethersx2 PS2 emulator, best to use an X11 desktop for best performance.  
With RK3588 and Panfork use malirun  
For RK3588 use : malirun ./AetherSX2-v1.5-3606.AppImage  
 
 
After building Xonotic you go to the directory :   
  cd ~/xonotic  
To run Xonotic :  
  ./all run  
  
Thanks to, in no perticular order : Salva (YT MicroLinux), PtitSeb (creator of Box86/64 gl4es ...), MonkaBlyat (Linux guru who helped with Winetricks and Mailor-droid), ChisBread, DarkevilPT, RPardini, and all other who helped.  
