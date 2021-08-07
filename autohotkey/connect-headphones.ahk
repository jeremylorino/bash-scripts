; #NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; ; #Warn  ; Enable warnings to assist with detecting common errors.
; SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
; SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; Easy to make GUIs
Gui, Add, Text, , Enter your name
Gui, Add, Edit, vName w150
Gui, Add, Button, , OK
Gui, Show
Return

ButtonOK:
Gui, Submit, Destroy
MsgBox Hello %Name%
Return

Esc::
GuiClose:
ExitApp