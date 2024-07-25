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
    RunWait batchFilePath 	
}
	
; Create a hotkey to open file selection dialog (CRTL+E)
^e:: {
    ; Open the file selection dialog
    SelectedFile := FileSelect(3, , "Select a file", "Video file (*.mp4)") ; "Video file (*.mp4)"
	if SelectedFile = ""
		MsgBox "The dialog was canceled."
	else{
		; To fetch all info:
		SplitPath SelectedFile, &name, &dir, &ext, &name_no_ext 
		SetWorkingDir dir
		RunWait "C:\Program Files\Audacity\audacity.exe " '"' SelectedFile '"'  ; Opens
		batchFilePath := A_WorkingDir name_no_ext "-replaceaudio.bat"
		batchContent := "ffmpeg -i " name_no_ext ".mp4 -i " name_no_ext ".m4a -c:v copy -c:a aac -map 0:v:0 -map 1:a:0 " name_no_ext "Final.mp4"
		
		RunAsBatchFile(batchFilePath, batchContent)	
		
		}
}
