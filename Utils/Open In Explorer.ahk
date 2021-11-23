FullFileName := A_Args[1]
If !FileExist(FullFileName)
	Return

Run A_ComSpec ' /c explorer.exe /select, "' FullFileName '"', , "Hide" ; Open through cmd.exe in Explorer and highlight
