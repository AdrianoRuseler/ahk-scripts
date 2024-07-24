#Requires AutoHotkey v2.0

; Function to run a CMD command and return video ID
GetID(yturl) {
    ; Create a temporary file to capture the output 
    tempFile := A_Temp "\vid.txt"
	
	batchFilePath := A_Temp "\vid.bat"
	batchContent := "yt-dlp --get-id " yturl " > " tempFile

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
    FileDelete(batchFilePath)
	FileDelete(tempFile)
    
    ; Return the output
    return output
}

; Example usage 
^+d:: ;CTRL+SHIFT+D
{
	url := A_Clipboard
	ytid := GetID(url)
	MsgBox "ID: " ytid
}