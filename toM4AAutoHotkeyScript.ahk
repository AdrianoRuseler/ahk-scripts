#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^e::
FileSelectFile MyFile, 3 , %A_ScriptDir% , Pick a *.mp3 file to convert: , Audio Files (*.mp3)
if MyFile =
    MsgBox, You didn't select a file
else{
    ;MsgBox, You selected file "%MyFile%".
	SplitPath, MyFile,File, FileDir, FileExt, FileName ; Gets file folder path
	SetWorkingDir %FileDir% 
;	MsgBox, You selected file "%MyFile%" with name %FileName% in folder %FileDir%.
;    RunWait, "C:\Program Files (x86)\Audacity\audacity.exe" %MyFile% ; Opens selected file on Audacity
	
;	RunWait
;	MsgBox, Feche para mover "%FileName%.m4a" para %FileDir%.
;	FileMove, C:\Users\ADNP\Documents\Audacity\%FileName%.m4a, %FileDir%

	file := FileOpen("convertaudio.bat", "w")
	if !IsObject(file)
	{
		MsgBox Can't open file for writing.
		return
	}

	TestString = ffmpeg  -i "%FileName%.mp3" -c:a aac -vn "%FileName%.m4a" ; When writing a file this way, use `r`n rather than `n to start a new line.
	file.Write(TestString)
	file.Close()

run convertaudio.bat

}
Return