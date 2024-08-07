#Requires AutoHotkey v2.0

; Function to write a batch file and run it 
RunAsBatchFile(batchFilePath, batchContent) {
    try {
        FileDelete(batchFilePath) ; Ensure the file doesn't already exist
    } catch {
        ; If the file doesn't exist, ignore the error
    }
    FileAppend(batchContent, batchFilePath)
	
	; Run batch file
    Run batchFilePath 	
}
								
; Example usage 
^+e:: ;CTRL+SHIFT+E
{
 ; Open the file selection dialog
    SelectedFile := FileSelect(3, , "Select a file", "All Files (*.*)") ; "Text Documents (*.txt; *.doc)"
	if SelectedFile = ""{
		MsgBox "The dialog was canceled."
		return
		}

	; To fetch all info:
	SplitPath SelectedFile, &name, &dir, &ext, &name_no_ext
	SetWorkingDir dir
		
	batchFilePath := A_WorkingDir "\extract-" name_no_ext ".bat"	
	batchContent := "ffmpeg -i '" name "' -map 0:a -c copy '" name_no_ext ".m4a'"
	
	RunAsBatchFile(batchFilePath, batchContent)
}




		
		