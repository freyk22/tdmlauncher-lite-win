/*
================================
= The Darkmod Launcher Lite
= v20160829
================================
= Author:
= Freek "freyk" Borgerink
================================

Description
This Launcher is created for the game The Dark Mod. (http://www.thedarkmod.com)
It launches the dark mod or the updater.
Created with Nsis and Coolsolft nsisdialogdesigner
   
=================
Required nsis plugins
The following nsis plugin is needed for this script
- nsProcess 1.6, http://nsis.sourceforge.net/NsProcess_plugin

===================
*/

;Variables
!define AppName "The Dark Mod Launcher - Lite"
!define AppCreator "Broken Glass Studios"
!define AppWebsite "http://www.thedarkmod.com"
!define Appdir "c:\games\darkmod"   ; "c:\games\darkmod" or "$PROGRAMFILES\darkmod"

!define InstallerName "${AppName}"
!define InstallerVersion "v20160828"
!define InstallerAuthor "Freek 'Freyk' Borgerink"
!define InstallerFilename "tdm_launcher-lite.exe"

;--------------------------------
;Includes 

!include "MUI2.nsh" ;for Modern UI
!include "LogicLib.nsh" ;for flowcontrol
!include "nsProcess.nsh" ;for nsprocess
!include "tdmlauncherlite.nsdinc"

;--------------------------------
;General

; Filename and Location of the installer
OutFile "${InstallerFilename}"
Name "${AppName}" 
Caption "${InstallerName}"

;--------------------------------
;Interface Settings

BrandingText "${InstallerName}, ${InstallerVersion} by Freek 'Freyk' Borgerink"

!define MUI_ICON "graphics\darkmod.ico"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "graphics\darkmodinstaller-header.bmp"

;Installer file-description
VIProductVersion "0.0.0.0"
VIAddVersionKey ProductName "${InstallerName}"
VIAddVersionKey Comments "${InstallerName} is an application that launches gameexecutable or the updater for the game, The Dark Mod.  For additional details, visit ${AppWebsite}"
VIAddVersionKey CompanyName "${AppCreator}"
VIAddVersionKey LegalCopyright "${AppCreator}"
VIAddVersionKey FileDescription "${InstallerName} is an application that launches gameexecutable or the updater for the game, The Dark Mod.  For additional details, visit ${AppWebsite}"
VIAddVersionKey FileVersion ${InstallerVersion}
VIAddVersionKey ProductVersion ${InstallerVersion}
VIAddVersionKey InternalName "${InstallerName}"
VIAddVersionKey OriginalFilename "${InstallerFilename}"

;--------------------------------
;Pages
Page custom fnc_tdmlauncher_Show

;--------------------------------
;Languages
 
!insertmacro MUI_LANGUAGE "English"

;--------------------------------
;Installer Sections

Function fncTdmlauncherLeave
		
	${NSD_GetState} $hCtl_tdmlauncher_rbTDM $R0
	${NSD_GetState} $hCtl_tdmlauncher_rbTDMUpdater $R1
	${NSD_GetText} $hCtl_tdmlauncher_tbArguments $0
	
	; if checkbox "the dark mod" is checked
    ${If} $R0 = 1
		ExecShell "" ".\TheDarkMod.exe" "$0"
		; and kill the launcher
		${nsProcess::KillProcess} "${InstallerFilename}" $R0
    ${EndIF}
	
	; if checkbox "the dark mod updater" is checked
	${If} $R1 = 1
		ExecShell "" ".\tdm_update.exe" "$0"
		; and kill the launcher
		${nsProcess::KillProcess} "${InstallerFilename}" $R0
    ${EndIF}
	
FunctionEnd

Section

SectionEnd