#########################################
# Script to import XDB Items to the 
# appropriate databases
# Author: A.Rowe
# Created: 8th April 2025
#########################################
$TargetTS = "xTSSERVERx"

Write-Output "Target TimeScape Server is $TargetTS"

# Do the processing

# Import rules
Write-Output "Import items to PUBLIC_SILVER"
XdbImport "\\$($TargetTS)\PUBLIC_SILVER" "$PSScriptRoot\Rules\PUBLIC_GOLD" "PUBLIC_GOLD_20" "$PSScriptRoot\Logs\PublicSilverImport.log" -o

Write-Output "Import items to PUBLIC_GOLD"
XdbImport "\\$($TargetTS)\PUBLIC_GOLD" "$PSScriptRoot\Rules\PUBLIC_GOLD" "PUBLIC_GOLD_20" "$PSScriptRoot\Logs\PublicGoldImport.log" -o

Write-Output "Import items to PUBLIC"
XdbImport "\\$($TargetTS)\PUBLIC" "$PSScriptRoot\Rules\PUBLIC" "PUBLIC_20" "$PSScriptRoot\Logs\PublicItemsImport.log" -o

Write-Output "Import items to SYSTEM"
XdbImport "\\$($TargetTS)\SYSTEM" "$PSScriptRoot\Rules\SYSTEM" "SYSTEM_20" "$PSScriptRoot\Logs\SystemItemsImport.log" -o

Write-Output "$MyInvocation.MyCommand.Name run successfully"

