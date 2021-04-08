### DLD-RISA-Cleanup

This tool is used to clean DLD-Risa's old files.
It will run as a windows service on auto start.
The JSON config file specifys the number of days that needs to be met before the files are removed from the R: Drive
After the clean up has been completed a detailed log of the file removal will be appended to C:\dtiq\logs\DLD-Cleanup.log
The service will also write to the event log:
Event ID 200 once completed in the DTIQ-RemoteMan Log after the clean up has been performed.
The service will then sleep for 24 hours untill the next run.


### Installation
Use Installer DTIQ-DLD-RisaCleanup-Installer.exe


The file tree will be

C:\DTIQ\DTIQ-DLD-RisaCleanup.exe

        \Settings\DLDRisa-Cleanup.json
        
        \Settings\DLDRisa-Fisttime.ps1
        
        \logs\DLD-Cleanup.log
        
        
After extracting the files 
Run as administrator: DLDRisa-Fisttime.ps1
This will install the Event Viewer Log as well as the windows auto start service.


### Compiled information
EXE Compiled with Saipen PS Studio

Installer Complied with Advanced Installer 18.0 
 
