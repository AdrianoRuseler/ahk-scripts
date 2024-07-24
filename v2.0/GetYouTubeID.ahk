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

; Example YouTube URL
youtubeURL := "https://youtu.be/dQw4w9WgXcQ?si=aNVB0RQijGZ9zP7k"

; Get the video ID
videoID := GetYouTubeID(youtubeURL)

; Display the video ID in a message box
MsgBox "Video ID: " videoID




