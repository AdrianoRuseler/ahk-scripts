#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#=:: ; [Win]+[=]
    WinGet, window, ID, A
    InputBox, width, Resize, Width:, , 140, 130
    InputBox, height, Resize, Height:, , 140, 130
    WinMove, ahk_id %window%, , , , width, height
    return
	
	
	; WinMove: if WinActive("ahk_exe Simview.EXE") { 	width += 16 	height += 8 }
	
	
	
	