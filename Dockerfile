# Sample Dockerfile

# Indicates that the windowsservercore image will be used as the base image.
FROM mcr.microsoft.com/windows/servercore:ltsc2019

# Metadata indicating an image maintainer.
#LABEL maintainer="jshelton@contoso.com"

# Uses dism.exe to install the IIS role.
RUN dism.exe /online /enable-feature /all /featurename:iis-webserver /NoRestart

# Creates an HTML file and adds content to this file.
RUN echo "Hello World - Dockerfile" > c:\inetpub\wwwroot\index.html

#RUN ["powershell", "New-Item", "C:\\1cv8\\8.3.12.1714\\bin -ItemType Directory"]
#CMD ["DIR","c:/temp/"]


#COPY bin/wsisapi.dll C:/1cv8/8.3.12.1714/bin/

RUN ["powershell", "New-Item", "c:\\inetpub\\wwwroot\\ACC -ItemType Directory"]
COPY web.config c:/inetpub/wwwroot/ACC/
COPY default.vrd c:/inetpub/wwwroot/ACC/
#RUN ["type", "c:\\test1.txt"]

#ADD test2.txt c:/temp/

# Sets a command or process that will run each time a container is run from the new image.
#CMD ["type", "c:/temp/test2.txt"]
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
WORKDIR /
COPY prepare.ps1 Wait-Service.ps1 1cEnt.zip sqlncli.msi ./
RUN .\prepare.ps1
# powershell.exe -Command Remove-Item prepare.ps1 -Force
CMD .\Wait-Service.ps1 -ServiceName '1C:Enterprise 8.3 Server Agent' -AllowServiceRestart