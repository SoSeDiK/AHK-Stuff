TraySetIcon("ahk.ico")
#HotIf MouseIsOverTitleBar()
MButton:: {
	Try {
		WinMinimize "A"
	} Catch as Ignored {
	}
}

MouseIsOverTitleBar() {
	CoordMode("Mouse", "Screen")
	MouseGetPos(&xPos, &yPos, &WindowUnderMouseID)
	class := WinGetClass("ahk_id " WindowUnderMouseID)
	; Sends WM_NCHITTEST message to determine what part of the screen is under the mouse
	ErrorLevel := SendMessage(0x84, , ( yPos << 16 ) | xPos, , "ahk_id " WindowUnderMouseID)
	; Return value of 2 is HTCAPTION (title bar)
	return (class != "Shell_TrayWnd") && (ErrorLevel = 2)
}