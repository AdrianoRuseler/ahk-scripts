#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


^+d:: ;CTRL+SHIFT+D
	FileSelectFolder, OutputVar,%A_MyDocuments% , 3
	if (OutputVar = "")
		MsgBox, You didn't select a folder.
	else{
		;MsgBox, You selected folder "%OutputVar%".	
		SetWorkingDir %OutputVar%  ; Ensures a consistent starting directory.
		MsgBox O seguinte video será baixado via yt-dlp: %clipboard%
		file := FileOpen("getvideo.bat", "w")
		if !IsObject(file)
		{
			MsgBox Can't open file for writing.
			return
		}

		TestString = yt-dlp -f "(bv*[vcodec~='^((he|a)vc|h264)'][fps<=30][height<=1080]+ba[ext=m4a]/b[ext=mp4])" %clipboard% ; When writing a file this way, use `r`n rather than `n to start a new line.
		file.Write(TestString)
		file.Close()

		run getvideo.bat		
		}	
Return


^+a:: ;CTRL+SHIFT+A
	FileSelectFolder, OutputVar,%A_MyDocuments% , 3
	if (OutputVar = "")
		MsgBox, You didn't select a folder.
	else{
		;MsgBox, You selected folder "%OutputVar%".	
		SetWorkingDir %OutputVar%  ; Ensures a consistent starting directory.
		MsgBox O audio do seguinte video será baixado via yt-dlp: %clipboard%
		file := FileOpen("getvideo.bat", "w")
		if !IsObject(file)
		{
			MsgBox Can't open file for writing.
			return
		}

		TestString = yt-dlp -x -f "bestaudio[ext=m4a]/best[ext=mp4]/best" %clipboard% ; When writing a file this way, use `r`n rather than `n to start a new line.
		file.Write(TestString)
		file.Close()

		run getvideo.bat		
		}	
Return


;%A_MyDocuments%