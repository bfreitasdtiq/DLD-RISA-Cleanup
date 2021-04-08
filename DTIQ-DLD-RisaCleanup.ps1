<#	
	.NOTES
	===========================================================================
	 Created on:   	03/25/2021 5:22 PM
     Updated on:	04/07/2021
	 Created by:   	Brysen Freitas
	 Organization: 	DTIQ
	 Filename:     	DTIQ-DLD-RISACLEANUP
	===========================================================================
	.DESCRIPTION
		Used to clean up old RISA Audits on the R: Drive


#New-EventLog -LogName DTIQ-RemoteMan -Source DTIQ
#Write-EventLog -log DTIQ-Remoteman -source DTIQ -EntryType Information -eventID 200 -Message "Risa Drive has been cleaned purged all files older then $days "
#sc create "DTIQ-DLDRISACleanup" Displayname= "DTIQ-DLDRISACleanup" binpath= "C:\DTIQ\DTIQ-DLD-RISACLEANUP.EXE" start= auto 
#>

#JSON CONFIG READ
$SettingsDldclean= Get-Content -Path 'C:\dtiq\settings\DLDRisa-Cleanup.json' | ConvertFrom-Json
$days = $SettingsDldclean.DaysToWait


$Folder = "R:\"

#Delete files older than 6 months
Get-ChildItem $Folder -Recurse -Force -ea 0 |
? { !$_.PsIsContainer -and $_.LastWriteTime -lt (Get-Date).AddDays(-$days) } |
ForEach-Object {
	$_ | del -Force
	$_.FullName | Out-File C:\dtiq\logs\DLD-Cleanup.log -Append
}

#Delete empty folders and subfolders
Get-ChildItem $Folder -Recurse -Force -ea 0 |
? { $_.PsIsContainer -eq $True } |
? { $_.getfiles().count -eq 0 } |
ForEach-Object {
	$_ | del -Force
	$_.FullName | Out-File C:\dtiq\logs\DLD-Cleanup.log -Append
}

Write-EventLog -log DTIQ-Remoteman -source DTIQ -EntryType Information -eventID 200 -Message "Risa Drive has been cleaned purged all files older then $days "

Start-Sleep -Seconds 86400
