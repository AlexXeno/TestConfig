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

Copy-Database "$PSScriptRoot\DatabaseTemplates\MD_GOLD.XML" "\\$TargetTS\MD_GOLD" -SourceIsXML;
Copy-Database "$PSScriptRoot\DatabaseTemplates\MD_SILVER.XML" "\\$TargetTS\MD_SILVER" -SourceIsXML;
Copy-Database "$PSScriptRoot\DatabaseTemplates\MD_RAW.XML" "\\$TargetTS\MD_RAW" -SourceIsXML;
Copy-Database "$PSScriptRoot\DatabaseTemplates\PUBLIC_SILVER.XML" "\\$TargetTS\PUBLIC_SILVER" -SourceIsXML;
Copy-Database "$PSScriptRoot\DatabaseTemplates\PUBLIC_GOLD.XML" "\\$TargetTS\PUBLIC_GOLD" -SourceIsXML;
Copy-Database "$PSScriptRoot\DatabaseTemplates\PUBLIC.XML" "\\$TargetTS\PUBLIC" -SourceIsXML;
Copy-Database "$PSScriptRoot\DatabaseTemplates\COMMON.XML" "\\$TargetTS\COMMON" -SourceIsXML;
Copy-Database "$PSScriptRoot\DatabaseTemplates\SYSTEM.XML" "\\$TargetTS\SYSTEM" -SourceIsXML;

Write-Output "$MyInvocation.MyCommand.Name completed"
