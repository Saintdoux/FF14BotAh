    SendMode, Input

    itemFinder("minerai de cobalt")

    itemFinder("minerai de fer")

    itemFinder("sable de palladium")

    itemFinder("clat de glace")

    itemFinder("lingot de cobalt")

    itemFinderSecondPosition("mica blanc")

    itemFinder(operator){
     Click, 592, 147
     Sleep 500

     ControlSend, ,{ctrl down}{a}{ctrl up}, ahk_class FFXIVGAME
     Sleep 500

     ControlSend, ,%operator%, ahk_class FFXIVGAME
     Sleep 500

     ControlSend, ,{Enter}, ahk_class FFXIVGAME
     Sleep 1000

     Click, 882, 153
     Sleep 500 
     Click, 1056, 153
     Sleep 2000

     ControlSend, ,{PrintScreen}, ahk_class FFXIVGAME
     Sleep 500

     ControlSend, ,{Esc}, ahk_class FFXIVGAME
     Sleep 1000

     Return
}

itemFinderSecondPosition(operator){
     Click, 592, 147
     Sleep 500

     ControlSend, ,{ctrl down}{a}{ctrl up}, ahk_class FFXIVGAME
     Sleep 500

     ControlSend, ,%operator%, ahk_class FFXIVGAME
     Sleep 500

     ControlSend, ,{Enter}, ahk_class FFXIVGAME
     Sleep 1000

     Click, 882, 190
     Sleep 500 
     Click, 1056, 190
     Sleep 2000

     ControlSend, ,{PrintScreen}, ahk_class FFXIVGAME
     Sleep 500

     ControlSend, ,{Esc}, ahk_class FFXIVGAME
     Sleep 1000

     Return
}
ExitApp
b::ExitApp