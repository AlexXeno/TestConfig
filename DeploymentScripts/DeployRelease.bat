ECHO Running deployment script...
mkdir "%~dp0\Logs"
powershell "& '%~dp0\ApplyDBT.ps1'" > "%~dp0\Logs\ApplyDBT.log"
powershell "& '%~dp0\ImportXDBItems.ps1'" > "%~dp0\Logs\ImportXDBItems.log"
powershell "& '%~dp0\CopyWorkflowScripts.ps1'" > "%~dp0\Logs\CopyWorkflowScripts.log"
powershell "& '%~dp0\RunSqlScripts.ps1'" > "%~dp0\Logs\RunSqlScripts.log"
ECHO deployment completed...
