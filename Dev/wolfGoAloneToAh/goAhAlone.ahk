
tpToUldah()

goToetherite()

tpToAH()

mooveToAh()


;All Function

tpToUldah(){
    ControlSend, ,{ctrl down}{y}{ctrl up}, ahk_class FFXIVGAME
    Sleep 1000

    ControlSend, ,{ctrl down}{q}{ctrl up}, ahk_class FFXIVGAME
    
    Loop {
        PixelGetColor, healbar, 63, 50 ; Get the color of the Top Left Icon
            If (healbar = 0x684FC3){
                Sleep 1000
                break
            }
    }


}


goToetherite(){
    Send {g down}  
    Sleep 4000
    Send {g up}

    Send {r down}
    Sleep 3000
    Send {r up}

    Send {g down}  
    Sleep 3000
    Send {g up}

    Send {r down}
    Sleep 6000
    Send {r up}

    Send {g down}
    Sleep 1000
    Send {g up}
}

tpToAH(){
    Loop 4 {
        ControlSend, ,{Numpad0}, ahk_class FFXIVGAME
        Sleep 500 
    }     
    MouseMove, 1226, 603
    Sleep 500
    Click, 1226, 603
    Sleep 500
    Click, 1226, 603

    Sleep 3000

    Loop {
        PixelGetColor, healbar, 63, 50 ; Get the color of the Top Left Icon
            If (healbar = 0x684FC3){
                Sleep 1000
                break
            }
    }

}

mooveToAh(){
    Send {Numpad7}
    Sleep 100

    Click 1069,301
    Sleep 2000

    Send {d down}
    Sleep 1500
    Send {d up}
}




ExitApp
b::ExitApp

