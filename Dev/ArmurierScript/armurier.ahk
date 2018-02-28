;Script Craft Armurier
nbrCraft=0

InputBox, nbrCraft , Please enter the number of craft you want,, 100, 100, , , ,

Loop %nbrCraft% {

    Click, 1247 730

    Sleep 1000 

    ControlSend, ,{Numpad1}, ahk_class FFXIVGAME

    Sleep 30000

}

ExitApp
b::ExitApp