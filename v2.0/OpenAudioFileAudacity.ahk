#Requires AutoHotkey v2.0

; Create a hotkey to open file selection dialog (Ctrl + Alt + F)
^!f:: {
    ; Open the file selection dialog
    SelectedFile := FileSelect(3, , "Select a file", "All Files (*.*)") ; "Text Documents (*.txt; *.doc)"
	if SelectedFile = ""
		MsgBox "The dialog was canceled."
	else{
		; To fetch all info:
		SplitPath SelectedFile, &name, &dir, &ext, &name_no_ext
		MsgBox "The following file was selected:`n" SelectedFile
		RunWait "C:\Program Files\Audacity\audacity.exe " '"' SelectedFile '"'  ; Opens
		MsgBox "Closed:`n" SelectedFile		
		}
}
