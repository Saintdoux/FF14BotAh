#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance, Force


Gui, Show, w600 h300, INI Read/Write Test
Gui Margin, 5,5
Gui Add, GroupBox, w290 h290, Configuration

; Example 1: Without the use of section
Gui, Add, Text, xp+10 yp+20, Please enter the path of the 
Gui, Add, Text, xp y+4, \FINAL FANTASY XIV Online\boot\ffxivboot.exe:
Gui, Add, Edit,w270 vEdit1,

Gui, Add, Text, xp y+4 wp, Please enter your password:
Gui, Add, Edit,w270 vEdit2,

Gui, Add, Text, xp y+4 wp, Please Select an option for the UniqueCode:
Gui, Add, DropDownList,vEdit3, True||False

Gui, Add, Button,xp+100 y+25 w75 h50 gwrite, INI Write



Gui Add, GroupBox,xp+190 y5 w290 h290, Verification
Gui, Add, Text, xp+10 yp+20 wp, This is the path oy your game :
Gui, Add, Edit,w270 ReadOnly vRead1

Gui, Add, Text, xp y+4 wp, This is your password :
Gui, Add, Edit,w270 ReadOnly vRead2

Gui, Add, Text, xp y+4 wp, True = Use Unique Code False = Dont use it
Gui, Add, Edit,w270 ReadOnly vRead3

Gui, Add, Button, xp+100 y+45 w75 h50 gread, INI Read


Return

write:  ; To INI write in a loop all variables must have the same name
Gui, Submit, NoHide ; In this case any variable not named "Edit" will not work.
Loop, 3
	{
	IniWrite, % Edit%A_Index%, Config.ini, ConfigPerso, Key%A_Index% 
	IniWrite, .\img\login.png, Config.ini, DontTouch, loginButton 
	IniWrite, .\img\play.png, Config.ini, DontTouch, playButton 

	;To combine two variables use three percent signs with a space after the first.
	}
Return

read:  ; in this case all variables will be ReadVar1, ReadVar2 ect.
Loop, 3
	{
	IniRead, ReadVar%A_Index%, Config.ini, ConfigPerso, Key%A_Index%
	GuiControl, , Read%A_Index%, % ReadVar%A_Index%
	}
Return

Esc:
Exit:
GuiClose:
Gui, Destroy
ExitApp
