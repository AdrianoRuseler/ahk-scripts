#Requires AutoHotkey v2.0

; Function to run a CMD command
RunCMD(command) {
    ; Create a temporary file to capture the output
    tempFile := A_Temp "\cmd_output.txt"
    
    ; Run the command and redirect output to the temporary file
    RunWait 'cmd.exe /c "' command ' > "' tempFile '"',, 'Min'
    
    ; Read the output from the temporary file
    output := FileRead(tempFile)
    
    ; Delete the temporary file
    FileDelete(tempFile)
    
    ; Return the output
    return output
}

; Example usage
cmd := "echo Hello, World!"
output := RunCMD(cmd)
MsgBox "Output: " output