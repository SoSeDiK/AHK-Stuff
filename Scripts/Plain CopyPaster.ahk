TraySetIcon("ahk.ico")

^#v:: {									; Text–only paste from Clipboard | Ctrl + Win + V
   SavedClipboard := ClipboardAll()
   A_Clipboard := A_Clipboard			; Convert to the plain text
   Send "^v"
   Sleep 50								; Don't change Clipboard while pasting, wait!
   A_Clipboard := SavedClipboard			; Restore original Clipboard
}

^#c::
^#x:: {									; Text-only copy/cut to Clipboard | Ctrl + Win + C / X
   SavedClipboard := ClipboardAll()
   A_Clipboard := ""
   XHotKey := SubStr(A_ThisHotKey, -1)	; C or X
   Send "^" XHotKey
   If !ClipWait(2)						; Wait for some text, up to 2s
      A_Clipboard := SavedClipboard		; Restore the original ClipBoard
   Else
      A_Clipboard := A_Clipboard		; Convert to plain text
}
