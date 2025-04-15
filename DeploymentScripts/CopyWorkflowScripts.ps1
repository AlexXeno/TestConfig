##############################################################
#
# Script to archive previous PowerShell workflow scripts and
# apply new scripts
# Author: A.Rowe
# Created: 9th April 2025
#
##############################################################
$suffix = "." + (Get-Date -Format "yyyyMMdd");
$sourceFolder = "$PSScriptRoot\Workflow";
$targetFolder = "D:\Data\Workflow\";
$archiveFolder = "$targetFolder\Archive\";

if ((Test-Path $archiveFolder) -ne $true)
{
    New-Item -Path $archiveFolder -ItemType directory;
}

if(Test-Path "$sourceFolder\Archive.txt")
{
    $archiveFiles = Get-Content "$sourceFolder\Archive.txt";
    $nFiles = $archiveFiles.Count;
    Write-Output "$nFiles files to be archived";

    foreach ($archiveFile in $archiveFiles)
    {
        $oldName = $targetFolder + $archiveFile;
        if (Test-Path $oldName)
        {
            $file = Get-ChildItem -Path $oldName;
            $newName = $archiveFolder + $file.BaseName + $suffix + $file.Extension;
            Write-Output "Archiving $oldName to $newName";
            Move-Item -Path $oldName -Destination $newName -Force;
        }
        else
        {
            Write-Output "Cannot archive $oldName - file not found";
        }
    }
}

$sourceFiles = Get-ChildItem -Path $sourceFolder\* -Include *.ps1,*.txt -Exclude Archive.txt;
$nFiles = $sourceFiles.Count;
Write-Output "$nFiles files found in $sourceFolder";

foreach ($file in $sourceFiles)
{
    $oldName = $targetFolder + $file.Name;
    if (Test-Path -Path $oldName)
    {
        $newName = $archiveFolder + $file.BaseName + $suffix + $file.Extension;
        Write-Output "Archiving $oldName to $newName";
        Move-Item -Path $oldName -Destination $newName -Force;
    }
    Write-Output "Copying $file to $targetFolder";
    Copy-Item -Path $file.FullName -Destination $targetFolder;
}

Write-Output "$($MyInvocation.MyCommand.Name) completed"
