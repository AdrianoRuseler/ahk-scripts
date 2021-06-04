#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^+m:: ;CTRL+SHIFT+M
run, https://www.openstreetmap.org

return


^+s:: ;CTRL+SHIFT+S
run, https://duckduckgo.com/?q=%clipboard%

return


^+d:: ;CTRL+SHIFT+S
run, https://www.autohotkey.com/docs/AutoHotkey.htm

return

<^>!m::

MsgBox, You pressed AltGr+m.

Return

;https://www.autohotkey.com/
;https://www.autohotkey.com/docs/AutoHotkey.htm
;https://github.com/ahkscript/SublimeAutoHotkey
;https://code.visualstudio.com/
;https://notepad-plus-plus.org/
;https://github.com/jNizM/ahk_notepad-plus-plus
;https://www.rosettacode.org/wiki/Category:AutoHotkey


;\\ODROIDXU4\Incomplete

