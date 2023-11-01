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
		
		RunWait, %ComSpec% /c yt-dlp --get-id %clipboard% > vid.txt	; Writes videos ID in txt file
		FileReadLine, OutputVar, vid.txt, 1	; Reads video ID from file

		; yt-dlp --list-formats %clipboard% > formats%OutputVar%.txt
		Run, %ComSpec% /c yt-dlp --list-formats %clipboard% > formats%OutputVar%.txt
		
		batfile = get%OutputVar%.bat
		MsgBox, 4, , %batfile% Do you want to continue? (Press YES or NO)
		IfMsgBox No
			return		
	
		file := FileOpen(batfile, "w")
		if !IsObject(file)
		{
			MsgBox Can't open file for writing.
			return
		}
		
		TestString = yt-dlp -f "bestvideo[height<=1080][ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" %clipboard%
		; Gets best for FX2490HD Monitor
		; TestString = yt-dlp -f "bestvideo[vcodec~='^((he|a)vc|h264)'][height<=1080][fps<=30][ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best" %clipboard% ; When writing a file this way, use `r`n rather than `n to start a new line.
		file.Write(TestString)
		file.Close()
		
		run %batfile%
		}	
Return

^+a:: ;CTRL+SHIFT+A
	FileSelectFolder, OutputVar,%A_MyDocuments% , 3
	if (OutputVar = "")
		MsgBox, You didn't select a folder.
	else{
		;MsgBox, You selected folder "%OutputVar%".	
		SetWorkingDir %OutputVar%  ; Ensures a consistent starting directory.
		
		RunWait, %ComSpec% /c yt-dlp --get-id %clipboard% > vid.txt	; Writes videos ID in txt file
		FileReadLine, OutputVar, vid.txt, 1	; Reads video ID from file

		; yt-dlp --list-formats %clipboard% > formats%OutputVar%.txt
		Run, %ComSpec% /c yt-dlp --list-formats %clipboard% > formats%OutputVar%.txt
		
		batfile = get%OutputVar%.bat
		MsgBox, 4, , %batfile% Do you want to continue? (Press YES or NO)
		IfMsgBox No
			return		
	
		file := FileOpen(batfile, "w")
		if !IsObject(file)
		{
			MsgBox Can't open file for writing.
			return
		}
		
		; Gets best m4a file
		TestString = yt-dlp -x -f "bestaudio[ext=m4a]/best[ext=mp4]/best" %clipboard% ; When writing a file this way, use `r`n rather than `n to start a new line.
		file.Write(TestString)
		file.Close()
		
		run %batfile%
		}	
Return

