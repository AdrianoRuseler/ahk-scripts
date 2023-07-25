#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


^+a:: ;CTRL+SHIFT+A
run, https://google.com/search?q=site:escavador.com+%clipboard%
Return

^+f:: ;CTRL+SHIFT+F
run, https://google.com/search?q=%clipboard%
Return