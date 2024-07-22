#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^e:: ; CTRL+E
FileSelectFile MyFile, 3 , %A_ScriptDir% , Pick a video file to convert: , 
if MyFile =
    MsgBox, You didn't select a file
else{
	SplitPath, MyFile,File, FileDir, FileExt, FileName ; Gets file folder path
	SetWorkingDir %FileDir% 

	file := FileOpen("convertaudio.bat", "w")
	if !IsObject(file)
	{
		MsgBox Can't open file for writing.
		return
	}

	TestString = ffmpeg.exe -i "%FileName%.%FileExt%" -map 0 -vcodec copy -scodec copy -acodec ac3 -b:a 640k "%FileName%-AC3.%FileExt%" ; When writing a file this way, use `r`n rather than `n to start a new line.
	file.Write(TestString)
	file.Close()

run convertaudio.bat

}
Return
