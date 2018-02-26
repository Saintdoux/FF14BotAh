
OutputVar := IniGetKeys("Config.ini", "ConfigPerso")
msgbox, %OutputVar%
ExitApp



;     (¯`·._ (¯`·._  <[Function]>  _.·´¯) _.·´¯)
;-- Retrieves all keys in particular secion of a standard format .ini file --
;         OutputVar := IniGetKeys(Filename, Section [, Delimiter])

IniGetKeys(InputFile, Section)
{

	;msgbox, OutputVar=%OutputVar% `n InputFile=%InputFile% `n Section=%Section% `n Delimiter=%Delimiter%
    keyNumber=0
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
	return keyNumber
}
