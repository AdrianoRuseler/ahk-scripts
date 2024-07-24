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
								
; Example usage 
^+d:: ;CTRL+SHIFT+D
{
	yturl := A_Clipboard
	SetWorkingDir A_Desktop
	;SetWorkingDir A_Temp
	
	; Function to extract YouTube video ID from a URL
	ytid := GetYouTubeID(yturl)
	
	batchFilePath := A_WorkingDir "\get-" ytid ".bat"
	
	; -f, --format FORMAT  Video format code, see "FORMAT SELECTION" for more details
	vfc := "bestvideo[vcodec~='^((he|a)vc|h264)'][height<=1080][fps<=30][ext=mp4]+bestaudio[ext=m4a]/best[ext=mp4]/best"

	batchContent := "yt-dlp -f " '"' vfc '"' " " yturl 
	
	RunAsBatchFile(batchFilePath, batchContent)
}
