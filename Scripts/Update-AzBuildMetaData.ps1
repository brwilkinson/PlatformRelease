#requires -Module Az.Storage
#requires -Module Az.Accounts

<#
.SYNOPSIS
    Stage Build metadata from a Build on Azure Storage (Blob Container), for Deployment
.DESCRIPTION
    Stage Build metadata from a Build on Azure Storage (Blob Container), for Deployment. Primarily used for a PULL mode deployment where a Server can retrieve new builds via Desired State Configuration.
.EXAMPLE
    Update-AzBuildMetaData.ps1 -ComponentName $(ComponentName) -BuildName $(Build.BuildNumber) -BasePath "$(System.ArtifactsDirectory)/_$(ComponentName)/$(ComponentName)"

    As seen in an Azure DevOps pipeline
.INPUTS
    Inputs (if any)
.OUTPUTS
    Output (if any)
.NOTES
    Updated 04/03/2021 
        - Moved the script from using Storage File Shares to Storage Blob Containers

#>

Param (
    [String]$BuildName = '4.2',
    [String]$ComponentName = 'LogHeadersAPI',
    [String]$BasePath = 'D:\Builds',
    [String]$Environment = 'D',
    [String]$MetaDataFileName = 'ComponentBuild.json'
)

# Azure Blob Container Info
[String]$SAName = 'acu1brwhaag1saglobal'
[String]$ContainerName = 'builds'

# Get context using Oauth
$Context = New-AzStorageContext -StorageAccountName $SAName -UseConnectedAccount

$StorageContainerParams = @{
    Container = $ContainerName
    Context   = $Context
}

Get-AzStorageBlob @StorageContainerParams -Blob $ComponentName/$MetaDataFileName | ft -AutoSize
Get-AzStorageBlobContent -Force @StorageContainerParams -Blob $ComponentName/$MetaDataFileName -Destination $BasePath/$ComponentName/$MetaDataFileName -Verbose

$data = Get-Content -path $BasePath/$ComponentName/$MetaDataFileName | ConvertFrom-Json
Write-Verbose -Message "Previous Build in [$environment] was [$($data.ComponentName.$ComponentName.$Environment.DefaultBuild)]" -verbose
Write-Verbose -Message "Current  Build in [$environment] is  [$BuildName]" -verbose
$data.ComponentName.$ComponentName.$Environment.DefaultBuild = $BuildName

$data | ConvertTo-Json -Depth 5 | Set-Content -Path $BasePath/$ComponentName/$MetaDataFileName -PassThru

Set-AzStorageBlobContent @StorageContainerParams -File $BasePath/$ComponentName/$MetaDataFileName -Blob $ComponentName/$MetaDataFileName -Verbose -Force | ft -AutoSize

if ($?)
{
    Write-Verbose -Message "MetaData File Upload to Blob is Complete" -Verbose
}