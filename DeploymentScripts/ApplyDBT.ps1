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

# Extend this array if more databases are added
$templates = $("MD_GOLD", "MD_SILVER", "MD_RAW", `
    "PUBLIC_SILVER", "PUBLIC_GOLD", "COMMON", "PUBLIC", "SYSTEM")

$templates % {
  try
  {
    Write-Output "Deploying template to \\$TargetTS\$_"
    Copy-Database "$PSScriptRoot\..\DatabaseTemplates\$($_)_DBT.XML" "\\$TargetTS\$_" -SourceIsXML;
  }
  catch
  {
    Write-Output "Exception: $_.Exception.Message"
  }
}

Write-Output "$MyInvocation.MyCommand.Name completed"
