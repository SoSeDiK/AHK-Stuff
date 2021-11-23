TraySetIcon("ahk.ico")

#f2:: {				; <-- Regular Search Using Highlighted Text (Win + F2)
	GoogleIt(1)
}

^#f2:: {				; <-- Images Search Using Highlighted Text (Win + Ctrl + F2)
	GoogleIt(2)
}

!#f2:: {				; <-- Map Search Using Highlighted Text (Win + Alt + F2)
	GoogleIt(3)
}



GoogleIt(SearchType) {
	; Save clipboard
	SavedClipboard := ClipboardAll()
	A_Clipboard := ""

	; Copy highlighted text to the clipboard
	Send "^c"
	If not ClipWait(.5)
		Query := InputBox("Enter the text to search:", "Google Search", "W200 H100").Value
	Else
		Query := A_Clipboard

	; Search
	If (SearchType = 1)
		Address := "http://www.google.com/search?hl=en&q=" Query					; Web Search
	Else If (SearchType = 2)
		Address := "http://www.google.com/search?site=imghp&tbm=isch&q=" Query	; Image Search
	Else
		Address := "http://www.google.com/maps/search/" Query						; Map Search

	Run 'chrome.exe "' Address '"'

	; Restore the clipboard
	A_Clipboard := SavedClipboard
	SavedClipboard := ""
}
