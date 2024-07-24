﻿#Requires AutoHotkey v2.0

; Function to extract YouTube video ID from a URL
GetYouTubeID(url) {
    ; Regular expression pattern to match YouTube video IDs
    pattern := "(?:youtu\.be/|youtube\.com/(?:watch\?v=|embed/|v/|.+\?v=))([^\&\?\/]+)"
    match := {}
    if RegExMatch(url, pattern, &match) {
        return match[1]
    }
    return ""
}

; Function to run a CMD command and return video ID
GetFormats(yturl) {
	; Function to extract YouTube video ID from a URL
	ytid := GetYouTubeID(yturl)

    ; Create a temporary file to capture the output 
    tempFile := A_WorkingDir "\vid-" ytid "-formats.txt"  
	
	batchFilePath := A_WorkingDir "\vid-" ytid "-formats.bat"
	batchContent := "yt-dlp --list-formats " yturl " > " tempFile

    try {
        FileDelete(batchFilePath) ; Ensure the file doesn't already exist
    } catch {
        ; If the file doesn't exist, ignore the error
    }
    FileAppend(batchContent, batchFilePath)
    
    ; Run the command and redirect output to the temporary file
    RunWait batchFilePath ,, 'Min'
	
    ; Read the output from the temporary file
    fileContent := FileRead(tempFile)
	; Extract the first line
	output := StrSplit(fileContent, "`n")[1]
    
    ; Delete the temporary file
    ;FileDelete(batchFilePath)
	;FileDelete(tempFile)
    
    ; Return the output
    return output
}

; Example usage 
^+d:: ;CTRL+SHIFT+D
{
	url := A_Clipboard
	SetWorkingDir A_Desktop
	;SetWorkingDir A_Temp
	ytformats := GetFormats(url)
	MsgBox "Formats: " ytformats
}