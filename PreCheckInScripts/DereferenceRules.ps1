##################################
# Script to go through all XML
# files and tokenise the server 
# names 
# Author: A.Rowe
# Created: 9th April 2025
##################################
# Load global parameters
$myPath = $PSScriptRoot
. "$myPath\global-parameters.ps1"

$global:TSServerNames % {
$serverToReplace = $_
Write-Output "Replacing $serverToReplace with $global:TSServerToken"
gci $myPath\..\Rules\ *.XML -recurse | ForEach {Write-Output "Processing file $_"
  (Get-Content $_.FullName -ReadCount 0 | ForEach {$_ -replace $serverToReplace, $global:TSServerToken}) | Set-Content $_.FullName 
}
