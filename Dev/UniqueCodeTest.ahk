/* ---
- Will load all keys as variables of a particular section of an ini file

loadVarsFromIni(iniFile,iniSections)

iniFile = Set to the path to the iniFile
iniSections = Set to the section(s) of the iniFile to load.
				Seperate multiple sections with commas
				(If this variable is empty, the whole iniFile will be loaded)
*/

; Examples

iniFile = Config.ini
loadVarsFromIni(iniFile,"ConfigPerso")





; Function

loadVarsFromIni(iniFile,iniSectionsToLoad)
{
	loadEm = 0
    keyNumber=0
    loopToDo=0
	Loop, Read, %iniFile%
	{ 
		; Scan for section, if the line is a section, get section name,
		; compare to iniSectionsToLoad, set loadEm flag
		If A_LoopReadLine contains [
		{
			If A_LoopReadLine contains ]
			{
				StringMid, anIniSection, A_LoopReadLine, InStr(A_LoopReadLine,"]")-1, StrLen(A_LoopReadLine)-2, L ; Get section name
				If anIniSection in %iniSectionsToLoad% ; is it in our matchlist?
					loadEm = 1
				Else
					loadEm = 0
				if iniSectionsToLoad = ; is it empty? -> get all
					loadEm = 1
			}
		}
		; Set key and value of the line to a variable named like the key
		; and with the value of the key
		If loadEm = 1
        {
	        Loop, Read, %InputFile%
	        {
		        If SectionMatch=1
		        {
			        If A_LoopReadLine=
				        Continue
			        StringLeft, SectionCheck , A_LoopReadLine, 1
			        If SectionCheck <> [
			        {
			            keyNumber ++
			        }
			        Else
				        SectionMatch=0
		        }
		        If A_LoopReadLine=[%Section%]
			        SectionMatch=1
	        }
            Loop loopToDo == keyNumber
		    {
			    If A_LoopReadLine contains = 
			    { 
				    StringSplit, Field, A_LoopReadLine, = 
				    %Field1% := Field2 
                    MsgBox, %Field2%
			    }
            }
		}
	}

b::ExitApp