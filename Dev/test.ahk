SendMode, Input

;Stop Spamming Numpad0 after connection And acces to the AH

    ;connectToAH()

;Search and screen the item

    itemFinder("lingot de cobalt")

    itemFinder("minerai de cobalt")

    itemFinder("minerai de fer")

    itemFinder("sable de palladium")

    itemFinder("clat de glace")

connectToAH(){
   

    Loop {
        PixelGetColor, healbar, 63, 50 ; Get the color of the Top Left Icon
            If (healbar = 0x684FC3){
                break
            }
            else {      
	            ControlSend, ,{Numpad0}, ahk_class FFXIVGAME
                Sleep 500
            }
    }

    ControlSend, ,{Esc}, ahk_class FFXIVGAME

    Loop, 2{
        ControlSend, ,{Numpad0}, ahk_class FFXIVGAME
        Sleep 500
    }
    Sleep 1000
}

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

b::ExitApp