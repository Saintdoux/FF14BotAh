ControlSend, ,{Esc}, ahk_class FFXIVGAME

    Loop, 2{
        ControlSend, ,{Numpad0}, ahk_class FFXIVGAME
        Sleep 500
    }
    Sleep 500

itemFinder("lingot de cobalt")

itemFinder("minerai de cobalt")

itemFinder("`éclat de glace")




; AllFunction In order of Use

itemFinder(operator){
     Click, 162, 75
     Sleep 100

     ControlSend, ,{ctrl down}{a}{ctrl up}, ahk_class FFXIVGAME
     Sleep 100

     ControlSend, ,%operator%, ahk_class FFXIVGAME
     Sleep 100

     ControlSend, ,{Enter}, ahk_class FFXIVGAME
     Sleep 500

     Click, 448, 79
     Sleep 100 
     Click, 448, 79
     Sleep 1000

     ControlSend, ,{PrintScreen}, ahk_class FFXIVGAME
     Sleep 500

     ControlSend, ,{Esc}, ahk_class FFXIVGAME
     Sleep 1000

     Return
}

b::ExitApp