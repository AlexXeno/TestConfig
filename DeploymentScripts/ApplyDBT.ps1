#########################################
# Script to import XDB Templates to the 
# appropriate databases
# Author: A.Rowe
# Created: 8th April 2025
#########################################
# Value is tokenised in github and replaced
# when release is built for each environment
$TargetTS = "xTSSERVERx"

Write-Output "Target TimeScape Server is $TargetTS"

if (-Not $TargetTS)
{
    Write-Output "No TimeScape Server specified"
    exit;
}

Add-PSSnapin Xenomorph.TimeScape;

Write-Output "Deploying template to \\$TargetTS\MD_GOLD"
Copy-Database "$PSScriptRoot\..\DatabaseTemplates\MD_GOLD_DBT.XML" "\\$TargetTS\MD_GOLD" -SourceIsXML;
Write-Output "Deploying template to \\$TargetTS\MD_SILVER"
Copy-Database "$PSScriptRoot\..\DatabaseTemplates\MD_SILVER_DBT.XML" "\\$TargetTS\MD_SILVER" -SourceIsXML;
Write-Output "Deploying template to \\$TargetTS\MD_RAW"
Copy-Database "$PSScriptRoot\..\DatabaseTemplates\MD_RAW_DBT.XML" "\\$TargetTS\MD_RAW" -SourceIsXML;
Write-Output "Deploying template to \\$TargetTS\PUBLIC_SILVER"
Copy-Database "$PSScriptRoot\..\DatabaseTemplates\PUBLIC_SILVER_DBT.XML" "\\$TargetTS\PUBLIC_SILVER" -SourceIsXML;
Write-Output "Deploying template to \\$TargetTS\PUBLIC_GOLD"
Copy-Database "$PSScriptRoot\..\DatabaseTemplates\PUBLIC_GOLD_DBT.XML" "\\$TargetTS\PUBLIC_GOLD" -SourceIsXML;
Write-Output "Deploying template to \\$TargetTS\PUBLIC"
Copy-Database "$PSScriptRoot\..\DatabaseTemplates\PUBLIC_DBT.XML" "\\$TargetTS\PUBLIC" -SourceIsXML;
Write-Output "Deploying template to \\$TargetTS\COMMON"
Copy-Database "$PSScriptRoot\..\DatabaseTemplates\COMMON_DBT.XML" "\\$TargetTS\COMMON" -SourceIsXML;
Write-Output "Deploying template to \\$TargetTS\SYSTEM"
Copy-Database "$PSScriptRoot\..\DatabaseTemplates\SYSTEM_DBT.XML" "\\$TargetTS\SYSTEM" -SourceIsXML;

Write-Output "$MyInvocation.MyCommand.Name completed"
