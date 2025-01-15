#Creación e instalación para crear un docker BC
install-Module BcContainerHelper

Enable-WindowsOptionalFeature -Online -FeatureName containers -All
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All

Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope CurrentUser

Import-Module BcContainerHelper

New-BcContainerWizard

#SCRIPT DE CREACIÓN
$containerName = 'learningbc'
$password = 'P@ssw0rd'
$securePassword = ConvertTo-SecureString -String $password -AsPlainText -Force
$credential = New-Object pscredential 'admin', $securePassword
$auth = 'UserPassword'
$artifactUrl = Get-BcArtifactUrl -type 'Sandbox' -country 'es' -select 'Latest'
New-BcContainer `
    -accept_eula `
    -containerName $containerName `
    -credential $credential `
    -auth $auth `
    -artifactUrl $artifactUrl `
    -updateHosts

    docker logs learningbc

    Web Client          : http://learningbc/BC/?tenant=default
Dev. Server         : http://learningbc
Dev. ServerInstance : BC
Dev. Server Tenant  : default
Setting learningbc to 172.22.75.190 in host hosts file
Setting learningbc-default to 172.22.75.190 in host hosts file
Setting learningbc-default to 172.22.75.190 in container hosts file

Files:
http://learningbc:8080/ALLanguage.vsix

Container Total Physical Memory is 31.7Gb
Container Free Physical Memory is 16.2Gb

Initialization took 35 seconds
Ready for connections!
Reading CustomSettings.config from learningbc
Creating Desktop Shortcuts for learningbc
Cleanup old dotnet core assemblies
Container learningbc successfully created
