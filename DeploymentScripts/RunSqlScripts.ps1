#####################################################
#
# Script to run various SQL scripts to deploy changes
# Author: A.Rowe
# Created: 9th April 2025
#
######################################################

Import-Module sqlps -DisableNameChecking;

if ($TargetEnvironment -eq "TEST")
{
    Write-Output "Target is TEST environment"
    $ServerInstance = "HEMCCAPPT002"
}
elseif ($TargetEnvironment -eq "INT")
{
    Write-Output "Target is INT environment"
    $ServerInstance = "HEMCCSQLI-CL\TSDB"
}
elseif ($TargetEnvironment -eq "PROD")
{
    Write-Output "Target is PROD environment"
    $ServerInstance = "HEMCCSQLP-CL1\TSDB"
}
else
{
    Write-Output "Unknown target environment specified - $($TargetEnvironment)"
    exit;
}

$sourceFolder = "$PSScriptRoot\SQL Scripts";
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
