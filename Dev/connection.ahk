; AutoHotKey To connect at FF14

IniRead, softExe, ./config.ini, ConfigPerso, softExe
IniRead, passWord, ./config.ini, ConfigPerso, passWord
IniRead, loginButton, ./config.ini, DontTouch, loginButton
IniRead, playButton, ./config.ini, DontTouch, playButton

;Run the game and wait for the game is ready to connect

    runLauncher(softExe)

;Enter the password and connect to the game 

    enterPwAndLaunchGame(loginButton,playButton,passWord)

;Stop Spamming Numpad0 after connection And acces to the AH

    connectToAH()

;Search and screen the item

    itemFinder("lingot de cobalt")

    itemFinder("minerai de cobalt")

    itemFinder("minerai de fer")

    itemFinder("sable de palladium")

    itemFinder("clat de glace")


; AllFunction In order of Use

runLauncher(exe){
    Run, %exe%
}


enterPwAndLaunchGame(button,button2,password){
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
                break ; image was found break loop and continue
            }
        }
}


connectToAH(){
    Sleep 10000

    Loop {
        PixelGetColor, healbar, 1104, 1001 ; Get the color of the healbar
            If (healbar = 0x106A33){
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
    Sleep 500
}

itemFinder(operator){
     Click, 592, 147
     Sleep 100

     ControlSend, ,{ctrl down}{a}{ctrl up}, ahk_class FFXIVGAME
     Sleep 100

     ControlSend, ,%operator%, ahk_class FFXIVGAME
     Sleep 100

     ControlSend, ,{Enter}, ahk_class FFXIVGAME
     Sleep 600

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
