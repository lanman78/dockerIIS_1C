New-Item C:\Distr\1C -ItemType Directory
New-Item "C:\Program Files\1cv8\srvinfo" -ItemType Directory
Expand-Archive -Path 1cEnt.zip -DestinationPath C:\Distr\1C
cd C:\Distr\1C\
& C:\Distr\1C\vc_redist.x64.exe /install /quiet
msiexec /i "1CEnterprise 8 (x86-64).msi" /qr TRANSFORMS=adminstallrelogon.mst DESIGNERALLCLIENTS=0 THICKCLIENT=0 THINCLIENTFILE=0 THINCLIENT=1 WEBSERVEREXT=1 SERVER=1 CONFREPOSSERVER=0 CONVERTER77=0 SERVERCLIENT=0 LANGUAGES=RU
#;1049.mst
#Remove-Item c:\sqlncli.msi -Force
New-Service -Name "1C:Enterprise 8.3 Server Agent" -BinaryPathName "`"C:\Program Files\1cv8\8.3.12.1714\bin\ragent.exe`" -srvc -agent -regport 1541 -port 1540 -range 1560:1591 -d `"C:\Program Files\1cv8\srvinfo`"" -DisplayName "1C:Enterprise 8.3 Server Agent" -Description "1C:Enterprise 8.3 Server Agent" -StartupType Auto -DependsOn "/"
#sc create "1C:Enterprise 8.3 Server Agent" binpath="\"C:\Program Files\1cv8\8.3.12.1714\bin\ragent.exe\" -srvc -agent -regport 1541 -port 1540 -range 1560:1591 -d \"C:\Program Files\1cv8\srvinfo\"" displayname="1C:Enterprise 8.3 Server Agent" start=auto depend="/"
# obj="rise-izh\usr1cv8" password="0okmNHY^7" start=disabled depend="/"
#sc.exe config "1C:Enterprise 8.3 Server Agent" depend= "/"