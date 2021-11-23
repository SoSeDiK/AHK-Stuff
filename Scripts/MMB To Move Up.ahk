; Press the middle mouse button to move up a folder in Explorer
TraySetIcon("ahk.ico")
#HotIf WinActive("ahk_class CabinetWClass")
~MButton::Send "!{Up}"
