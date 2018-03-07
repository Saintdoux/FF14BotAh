;Script Craft Armurier
nbrCraft=0
SendMode Input
InputBox, nbrCraft , Please enter the number of craft you want,, 100, 100, , , ,

Loop %nbrCraft% {

    Sleep 500

    Click, 1259 730
    Sleep 500

    Click, 1200 730

    Sleep 1000 

    ControlSend, ,{Numpad1}, ahk_class FFXIVGAME

    Sleep 30000

}

ExitApp
b::ExitApp