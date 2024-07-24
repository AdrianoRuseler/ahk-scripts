#Requires AutoHotkey v2.0

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

; Function to download YouTube video using yt-dlp
DownloadYouTubeVideo(yturl) {
    ; Function to extract YouTube video ID from a URL
	ytid := GetYouTubeID(yturl)

    ; Create a temporary file to capture the output 
    ;tempFile := A_WorkingDir "\get-" ytid "-formats.txt"  
	
	batchFilePath := A_WorkingDir "\get-" ytid ".bat"
	batchContent := "yt-dlp " yturl 

    try {
        FileDelete(batchFilePath) ; Ensure the file doesn't already exist
    } catch {
        ; If the file doesn't exist, ignore the error
    }
    FileAppend(batchContent, batchFilePath)
    
    ; Run the command and redirect output to the temporary file
    RunWait batchFilePath 
}

;-f, --format FORMAT             Video format code vfc
								
; Example usage 
^+d:: ;CTRL+SHIFT+D
{
	url := A_Clipboard
	SetWorkingDir A_Desktop
	;SetWorkingDir A_Temp
	;ytformats := GetFormats(url)
	DownloadYouTubeVideo(url)
}
