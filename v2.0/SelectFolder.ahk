#Requires AutoHotkey v2.0

^+f:: ;CTRL+SHIFT+F
{
	SelectedFolder := DirSelect(, 3)
	if SelectedFolder = ""
		MsgBox "You didn't select a folder."
	else{
		MsgBox "You selected folder '" SelectedFolder "'."
		SetWorkingDir SelectedFolder
		Run A_WorkingDir
		}
}