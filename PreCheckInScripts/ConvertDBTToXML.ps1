######################################################
#
# Script to convert .DBT database template files to
# XML so that they can be diff-ed and checked in
# Author: A.Rowe
# Created: 10th April 2025
#
######################################################
Add-PSSnapin Xenomorph.TimeScape;

# Extend this array if more databases are added
$templates = $("MD_GOLD", "MD_SILVER", "MD_RAW", `
    "PUBLIC_SILVER", "PUBLIC_GOLD", "COMMON", "PUBLIC", "SYSTEM")

$templates % {
  try
  {
    Write-Output "Converting template $_ to XML"
    Copy-Database "$PSScriptRoot\..\DatabaseTemplates\$($_).DBT" "$PSScriptRoot\..\DatabaseTemplates\$($_)_DBT.XML" -SourceIsTemplate -TargetIsXML;
  }
  catch
  {
    Write-Output "Exception: $_.Exception.Message"
  }
}

Write-Output "$MyInvocation.MyCommand.Name completed"
