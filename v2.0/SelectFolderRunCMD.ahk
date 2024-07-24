#Requires AutoHotkey v2.0

; Function to run a CMD command
RunCMD(command) {
    ; Create a temporary file to capture the output
    tempFile := A_WorkingDir "\cmd_output.txt"
    
    ; Run the command and redirect output to the temporary file
    RunWait 'cmd.exe /c "' command ' > "' tempFile '"',, 'Min'
    
    ; Read the output from the temporary file
    output := FileRead(tempFile)
    
    ; Delete the temporary file
    FileDelete(tempFile)
    
    ; Return the output
    return output
}

^+f:: ;CTRL+SHIFT+F
{
	SelectedFolder := DirSelect(, 3)
	if SelectedFolder = ""
		MsgBox "You didn't select a folder."
	else{
		MsgBox "You selected folder '" SelectedFolder "'."
		SetWorkingDir SelectedFolder
		Run A_WorkingDir
		
		; Example usage
		cmd := "yt-dlp --version"
		output := RunCMD(cmd)
		MsgBox "Version: " output

		}
}