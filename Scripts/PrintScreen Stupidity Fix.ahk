TraySetIcon("ahk.ico")
PrintScreen::#+s
; For some weird reason * wildcard does not work in this case
^PrintScreen::#+s
!PrintScreen::#+s
+PrintScreen::#+s
