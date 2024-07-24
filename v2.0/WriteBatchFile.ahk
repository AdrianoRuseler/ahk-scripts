#Requires AutoHotkey v2.0

; Function to write a batch file
WriteBatchFile(filePath, content) {
    try {
        FileDelete(filePath) ; Ensure the file doesn't already exist
    } catch {
        ; If the file doesn't exist, ignore the error
    }
    FileAppend(content, filePath)
}

; Example usage
batchFilePath := A_Desktop "\example.bat"
batchContent := "
(
@echo off
echo Hello, this is a batch file.
pause
)"

WriteBatchFile(batchFilePath, batchContent)
MsgBox "Batch file created at " batchFilePath




