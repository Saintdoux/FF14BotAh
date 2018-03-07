; AutoHotKey To connect at FF14
SendMode, Input

IniRead, softExe, ./config.ini, ConfigPerso, Key1
IniRead, passWord, ./config.ini, ConfigPerso, Key2
IniRead, uniqueCode, ./config.ini, ConfigPerso, Key3

IniRead, loginButton, ./config.ini, DontTouch, loginButton
IniRead, playButton, ./config.ini, DontTouch, playButton

If (softExe == "ERROR" or passWord == "ERROR" or uniqueCode == "ERROR" or softExe == "" or passWord == "" or uniqueCode == "") {
    MsgBox, Please Launch the readIni Script :)
}
Else {
;Run the game and wait for the game is ready to connect

    runLauncher(softExe)

;Enter the password and connect to the game 
    If(%uniqueCode% == True){
        connectionWithCode(loginButton,playButton,passWord,uniqueCode)
    }

    If(%uniqueCode% == False){
        connectionWithoutCode(loginButton,playButton,passWord)
    }
;Go to AH alone
    
    tpToUldah()

    goToetherite()

    tpToAH()

    mooveToAh()

;Stop Spamming Numpad0 after connection And acces to the AH

    connectToAH()

;Search and screen the item

    

    itemFinder("minerai de cobalt")

    itemFinder("minerai de fer")

    itemFinder("sable de palladium")

    itemFinder("clat de glace")

    itemFinder("lingot de cobalt")

    itemFinderSecondPosition("mica blanc")

}
    
; AllFunction In order of Use
;Connect to the Game
runLauncher(exe){
    Run, %exe%, , Max UseErrorLevel
    If (ErrorLevel = "ERROR"){
        MsgBox The path of the game are wrong
    }
}

connectionWithCode(button,button2,password,uniqueCode){
    Loop{
        ImageSearch, foundX, foundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %button%
            If (ErrorLevel = 0){
                break ; image was found break loop and continue
            }
    }

    Sleep, 500

    Send %password%

    InputBox, UniqueCodeClear , Please enter your Unique Code, Prompt,, 200, 100, , , ,

    Send {TAB}

    Sleep 200

    Send %UniqueCodeClear%

    Loop{
        ImageSearch, foundX, foundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %button%
            If (ErrorLevel == 0){
                Click, %foundX%, %foundY%
                break ; image was found break loop and continue
        }
    }

    Loop{
        ImageSearch, foundX, foundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %button2%
            If (ErrorLevel == 0){
                Click, %foundX%, %foundY%
                ;MouseMove, %foundX%, %foundY%
                break ; image was found break loop and continue
            }
        }
    Sleep 10000

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
    
}

connectionWithoutCode(button,button2,password){
    Loop{
        ImageSearch, foundX, foundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %button%
            If (ErrorLevel = 0){
                break ; image was found break loop and continue
            }
    }
    Sleep, 500

    Send %password%

    Loop{
        ImageSearch, foundX, foundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %button%
            If (ErrorLevel == 0){
                Click, %foundX%, %foundY%
                break ; image was found break loop and continue
        }
    }

    Loop{
        ImageSearch, foundX, foundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, %button2%
            If (ErrorLevel == 0){
                Click, %foundX%, %foundY%
                ;MouseMove, %foundX%, %foundY%
                break ; image was found break loop and continue
            }
        }

    Sleep 10000

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
}

connectToAH(){
    

    Loop, 2{
        ControlSend, ,{Numpad0}, ahk_class FFXIVGAME
        Sleep 500
    }
    Sleep 1000
}


;Find Item in AH and take screen
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

;Go to AH alone

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
