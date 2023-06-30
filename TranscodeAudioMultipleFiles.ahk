#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


^+m:: ;CTRL+SHIFT+M

FileSelectFile, files, M3  ; M3 = Multiselect existing files.
if (files = "")
{
    MsgBox, The user pressed cancel.
    return
}
Loop, parse, files, `n
{
    if (A_Index = 1){
       ; MsgBox, The selected files are all contained in %A_LoopField%.
		SetWorkingDir %A_LoopField%
	}
    else
    {
        ;MsgBox, 4, , The next file is %A_LoopField%.  Continue?
       ; IfMsgBox, No, break
		
		SplitPath, A_LoopField,File, FileDir, FileExt, FileName ; Gets file folder path	
		
		;MsgBox file %A_LoopField% with name %FileName% and ext %FileExt%		
		
		file := FileOpen("convertaudio.bat", "w")
			if !IsObject(file)
			{
				MsgBox Can't open file for writing.
				return
			}
		TestString = ffmpeg.exe -i "%FileName%.%FileExt%" -map 0 -vcodec copy -scodec copy -acodec ac3 -b:a 640k "%FileName%-AC3.%FileExt%" ; When writing a file this way, use `r`n rather than `n to start a new line.
		file.Write(TestString)
		file.Close()
        
		RunWait convertaudio.bat		
		
    }
}
return



