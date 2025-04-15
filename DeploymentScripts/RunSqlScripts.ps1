#####################################################
#
# Script to run various SQL scripts to deploy changes
# Author: A.Rowe
# Created: 9th April 2025
#
######################################################
Import-Module sqlps -DisableNameChecking;

# Value is tokenised in github and replaced
# when release is built for each environment
$ServerInstance = "xSQLINSTANCEx"

Write-Output "Target SQL Instance is $ServerInstance"
if (-Not $ServerInstance)
{
    Write-Output "No SQL Instance specified"
    exit;
}

$sourceFolder = "$PSScriptRoot\..\SQLScripts";
$logFolder = "$PSScriptRoot\Logs";

$sourceFiles = @(Get-ChildItem -Path $sourceFolder -Filter *.sql);
$nFiles = $sourceFiles.Length;
Write-Output "$nFiles files found in $sourceFolder";

foreach ($file in $sourceFiles)
{
    Write-Output "Running $file";
    $logName = $file.BaseName + ".log";
    Write-Output "Log file: $logFolder\$logName";

    try {
        Invoke-Sqlcmd -ServerInstance $ServerInstance -InputFile $file.FullName -Verbose | Out-File -FilePath "$logFolder\$logName";
    }
    catch {
        Write-Output $Error;
    }
}

Write-Output "$($MyInvocation.MyCommand.Name) completed"
