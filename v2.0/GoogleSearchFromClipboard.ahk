#Requires AutoHotkey v2.0

; This script will take the text from the clipboard and search it on Google.

^g:: ; Ctrl + G hotkey to trigger the search
{
    ; Get the plain text from the clipboard
    searchQuery := A_Clipboard

    ; URL encode the search query
    searchQuery := StrReplace(searchQuery, " ", "+")
    searchQuery := StrReplace(searchQuery, "&", "%26")
    searchQuery := StrReplace(searchQuery, "?", "%3F")
    searchQuery := StrReplace(searchQuery, "=", "%3D")

    ; Open the default web browser with the Google search URL
    Run "https://www.google.com/search?q=" searchQuery
}
