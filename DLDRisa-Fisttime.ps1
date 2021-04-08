New-EventLog -LogName DTIQ-RemoteMan -Source DTIQ
sc create "DTIQ-DLDRISACleanup" Displayname= "DTIQ-DLDRISACleanup" binpath= "C:\DTIQ\DTIQ-DLD-RISACLEANUP.EXE" start= auto 
Write-EventLog -log DTIQ-Remoteman -source DTIQ -EntryType Information -eventID 201 -Message "Risa Drive Cleanup Service has been installed"
Remove-Item -Path \Settings\DLDRisa-Fisttime.ps1
Start-Service -Name "DTIQ-DLDRISACleanup"
