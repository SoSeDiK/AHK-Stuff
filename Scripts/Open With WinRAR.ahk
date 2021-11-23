TraySetIcon("ahk.ico")

~LButton & RButton:: {
	Clip0 := ClipboardAll()
	A_Clipboard := ""
	Send "^c"
	ClipWait 1
	Path := A_Clipboard
	A_Clipboard := Clip0
	If SubStr(Path, -4) != ".jar" and SubStr(Path, -4) != ".apk" 
		Return
	Run 'C:\Program Files\WinRAR\WinRAR.exe "' Path '"'
}
