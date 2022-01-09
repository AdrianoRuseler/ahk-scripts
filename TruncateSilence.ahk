#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^e::
FileSelectFile MyFile, 3 , \\ODROIDXU4\Incomplete , Pick a file to truncate silence: , Audio Files (*.m4a)
if MyFile =
    MsgBox, You didn't select a file
else{
    Run, "C:\Program Files\Audacity\audacity.exe" "%MyFile%" ; Opens selected file on Audacity
}

MsgBox, Após a importação do arquivo pressione CRTL+\ 
Return


^\::

WinActivate, ahk_exe audacity.exe
Send ^a
Send ^+t
Send, {Enter}
;Send ^+e

MsgBox, Após a operação de remoção do silêncio, exporte o arquivo (CRTL+SHIFT+E)!

Return
