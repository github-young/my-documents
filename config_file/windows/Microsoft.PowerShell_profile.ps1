# Install oh-my-posh first
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH/robbyrussell.omp.json" | Invoke-Expression

# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Autocompletion for arrow keys
Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

# Alias
function GCIF {Get-ChildItem -Force $args[0]}
New-Alias -Name ll -Value GCIF
New-Alias -Name l -Value dir
New-Alias -Name c -Value cls
function ex {exit}
New-Alias -Name e -Value ex
