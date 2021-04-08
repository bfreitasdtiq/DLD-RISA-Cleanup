New-EventLog -LogName DTIQ-RemoteMan -Source DTIQ
sc create "DTIQ-DLDRISACleanup" Displayname= "DTIQ-DLDRISACleanup" binpath= "C:\DTIQ\DTIQ-DLD-RISACLEANUP.EXE" start= auto 
Remove-Item -Path \Settings\DLDRisa-Firsttime.ps1
Start-Service -Name "DTIQ-DLDRISACleanup"
Write-EventLog -log DTIQ-Remoteman -source DTIQ -EntryType Information -eventID 201 -Message "Risa Drive Cleanup Service has been installed"
