#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir C:\Users\Ruseler\Videos\youtube-dl ; Ensures a consistent starting directory.

^+d::
MsgBox O seguinte video será baixado via youtube-dl: %clipboard%

	file := FileOpen("getvideo.bat", "w")
	if !IsObject(file)
	{
		MsgBox Can't open file for writing.
		return
	}

	TestString = youtube-dl %clipboard% ; When writing a file this way, use `r`n rather than `n to start a new line.
	file.Write(TestString)
	file.Close()

run getvideo.bat

return