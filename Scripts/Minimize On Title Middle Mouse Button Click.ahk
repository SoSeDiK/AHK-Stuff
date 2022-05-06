TraySetIcon("ahk.ico")
#HotIf MouseIsOverTitleBar()
MButton::WinMinimize "A"

MouseIsOverTitleBar() {
	CoordMode("Mouse", "Screen")
	MouseGetPos(&xPos, &yPos, &WindowUnderMouseID)
	class := WinGetClass("ahk_id " WindowUnderMouseID)
	ErrorLevel := SendMessage(0x84, , ( yPos << 16 ) | xPos, , "ahk_id " WindowUnderMouseID)
	return (class != "Shell_TrayWnd") && (ErrorLevel = 2)
}