#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^e::
FileSelectFile MyFile, 3 , C:\Users\ADNP\Documents\Camtasia , Pick a file to analyze: , Video Files (*.mp4)
if MyFile =
    MsgBox, You didn't select a file
else{
    ;MsgBox, You selected file "%MyFile%".
	SplitPath, MyFile,File, FileDir, FileExt, FileName ; Gets file folder path
	SetWorkingDir %FileDir% 
;	MsgBox, You selected file "%MyFile%" with name %FileName% in folder %FileDir%.
    ;RunWait, "C:\Program Files (x86)\Audacity\audacity.exe" %MyFile% ; Opens selected file on Audacity
	Run, "C:\Program Files (x86)\Audacity\audacity.exe" "%MyFile%" ; Opens selected file on Audacity
    MsgBox, Press Ctrl+Alt+a after file import!
}
Return

^+a::

    WinActivate, ahk_exe audacity.exe
	Send, ^a
	Send, ^+m
    MsgBox, Remove noise, export audio and Press Ctrl+\ to merge audio file!
Return

^\::
    SetWorkingDir %FileDir% 
    FileMove, C:\Users\ADNP\Documents\Audacity\%FileName%.m4a, %FileDir%

	file := FileOpen("replaceaudio.bat", "w")
	if !IsObject(file)
	{
		MsgBox Can't open file for writing.
		return
	}

	TestString = ffmpeg -i %FileName%.mp4 -i %FileName%.m4a -c:v copy -c:a aac -map 0:v:0 -map 1:a:0 %FileName%Final.mp4 ; When writing a file this way, use `r`n rather than `n to start a new line.
	file.Write(TestString)
	file.Close()
	
	run, %FileDir%

	run, https://studio.youtube.com/channel/UC_OgVpuZxcIeHfWMMU6DvHQ/videos/upload?d=ud

	run replaceaudio.bat

Return