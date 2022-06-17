$MaximumHistoryCount = 20000

Import-Module posh-git
#Import-Module oh-my-posh
Import-Module PSReadLine
Import-Module Get-ChildItemColor
Import-Module Terminal-Icons
Import-Module DockerCompletion

# Set-PoshPrompt - Theme spaceship
#Set-PoshPrompt -Theme "$HOME\AppData\Local\oh-my-posh\spaceship.omp.json"
#oh-my-posh init pwsh --config "$HOME\AppData\Local\oh-my-posh\spaceship.omp.json" | Invoke-Expression
#oh-my-posh init pwsh --config "$HOME\AppData\Local\oh-my-posh\teste.omp.json" | Invoke-Expression
#oh-my-posh init pwsh --config "$HOME\AppData\Local\oh-my-posh\amro.omp.json" | Invoke-Expression
oh-my-posh init pwsh --config "$HOME\AppData\Local\oh-my-posh\amro.omp.json" | Invoke-Expression



# Uses tab for autocompletion
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

# History definitions
$HistoryFilePath = Join-Path ([Environment]::GetFolderPath('UserProfile')) .ps_history
Register-EngineEvent PowerShell.Exiting -Action { Get-History | Export-Clixml $HistoryFilePath } | out-null
if (Test-path $HistoryFilePath) { Import-Clixml $HistoryFilePath | Add-History }

Set-PSReadLineOption -HistorySearchCursorMovesToEnd
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward

Set-PSReadLineOption -ShowToolTips
Set-PSReadLineOption -PredictionSource History

# Aliases
Set-Alias which Get-Command
Set-Alias open Invoke-Item

function ll() { Get-ChildItem -Force | Format-Table }
function la() { Get-ChildItem -Force | Format-Wide }
function lb() { Get-ChildItem -Force | Format-List }

Set-Alias ls la
Set-Alias l lb


# Aliases Functions
function cdd() { Set-Location "C:\Users\re92950z\Downloads" }
function cdc() { Set-Location "C:\Users\re92950z\Documents" }
function cdi() { Set-Location "C:\Users\re92950z\Documents\INGESTAO" }

function opd() { open "C:\Users\re92950z\Downloads" }
function opp() { open "C:\Desenvolvimento\Projetos" }
function opdc() { open "C:\Users\re92950z\Documents" }
function opi() { open "C:\Users\re92950z\Documents\INGESTAO" }
function abra() { open $pwd }


function edp() { code $PROFILE }
function edh() { code "$HOME\AppData\Roaming\Microsoft\Windows\PowerShell\PSReadLine\ConsoleHost_history.txt" }
function eds() { code "$HOME\AppData\Local\oh-my-posh\spaceship.omp.json" }

# Compute file hashes - useful for checking successful downloads
function md5 { Get-FileHash -Algorithm MD5 $args }
function sha1 { Get-FileHash -Algorithm SHA1 $args }
function sha256 { Get-FileHash -Algorithm SHA256 $args }

function tail { Get-Content $args -Tail 30 -Wait }

function take {
    New-Item -ItemType directory $args
    Set-Location "$args"
}