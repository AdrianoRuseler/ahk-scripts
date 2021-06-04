#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir C:\Users\ADNP\Documents\Camtasia  ; Ensures a consistent starting directory.

^e::
    Send, %A_WorkingDir%
Return
