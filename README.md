# tdmlauncher-lite-win
a  Application Launcher for The Dark Mod

The Dark Mod Launcher Lite (windows) is created by
Freek "Freyk" Borgerink
https://freyk.wordpress.com

Created for the dark mod (http://www.thedarkmod.com)
Created with Nsis 3.04 and CoolSoft's NSISDialogDesigner 1.4.1

-- Description --
A Graphical launcher that can run the gamebinary and the updater,
using given arguments.
This is a a lite version of the coming original version.


-- Setting up the build environment --
1. 
Download and install nsis 
(http://nsis.sourceforge.net)

2.
Copy the src-folder.

3. 
Extract nsprocess.dll from "nssis-tools\nsProcess_1_6.zip\nsProcess_1_6\Plugin\nsProcess.dll" 
to "C:\Program Files\NSIS\Plugins\x86-ansi\" and "C:\Program Files\NSIS\Plugins\x86-unicode"

4.END


-- Compiling the script --


1. 
Go to the source folder. 

2.
Compile the installer:

Method 1:
right-click darkmodinstaller.nsi" > compile nsis script.

Method 2:
start cmd,
go to the source folder
and run: C:\Program Files\NSIS\makensis.exe /X"SetCompressor /FINAL lzma" darkmodinstaller.nsi

3.
END

-- Working on the code --

Use coolsoft's "nsis Dialog Designer" 
(http://coolsoft.altervista.org/en/nsisdialogdesigner)
to create the forms.

-- Versions --
Changes / bugfixes

20160829
- Publication of the binary and code
- Sourcecode and folder cleanup

20160828 (between 20160822)
- Added a form using coolsoft desinger
- added graphics
- Tried to remove other installer buttons. (close and cancel)
- added "Run" button
- added textbox for arguments
- added plugin nsprocess to kill processes.
- did get the header on a good position. 
  Solved by using the code of branched tdminstaller-win (20160822)
