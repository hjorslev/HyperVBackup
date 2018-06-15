<#
.SYNOPSIS
Perform a backup of Hyper-V Virtual Machines.

.DESCRIPTION
Perform a backup of Hyper-V Virtual Machines. This module exports Virtual Machines and compress them using 7zip.

.PARAMETER Name
Name of the Virtual Machine. You can get a list of your Hyper-V machines using Get-VM.

.PARAMETER BackupDestination
Specify the location of the backup.

.PARAMETER Retention
Configure how long you want to keep the backups.

.EXAMPLE
New-VMBackup -Name "GAME-01", "VPN-01" -BackupDestination 'D:\Backup\Hyper-V' -Retention 30

.NOTES
Module must be executed from an elevated prompt.
#>
function New-VMBackup
{
    [CmdletBinding(SupportsShouldProcess = $true, ConfirmImpact = 'Medium')]
    param 
    (
        [Parameter(
            Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'Enter one or more Hyper-V virtual machine names seperated by commas.'
        )][string[]]$Name,
        
        [Parameter(
            Mandatory = $true,
            HelpMessage = 'Enter the backup destination.'
        )][string]$BackupDestination,

        [switch]$Compress,
        
        [int]$Retention = 30
    )
    
    begin
    {
        ## Installing module 7Zip4Powershell if needed.
        if (-not (Get-Module -ListAvailable -Name '7Zip4Powershell'))
        {
            Install-Module -Name '7Zip4Powershell'
        }
    }
    
    process
    {
        if ($PSCmdlet.ShouldProcess("$($Name)"))
        {
            Write-Verbose -Message "Virtual machines to backup: $($Name)."
            Write-Verbose -Message "Backup destination: $($BackupDestination)."
            Write-Verbose -Message "Days to keep backup: $($Retention)."

            foreach ($VM in $Name)
            {
                $TimeStamp = Get-Date -Format "yyyy-MM-dd-HHmm"

                ## Exporting the VM.
                Export-VM -Name $VM -Path $BackupDestination
                
                if ($Compress)
                {
                    ## Compress the exported VM using 7Zip4PowerShell if the parameter is set.
                    Compress-7Zip -Path "$($BackupDestination)\$($VM)" -ArchiveFileName "$($BackupDestination)$($VM)-$($TimeStamp).7z"

                    ## Remove the exported folder as it's now compressed.
                    Remove-Item -Path "$($BackupDestination)$($VM)" -Force -Recurse
                }
            }
        }
    }
    
    end
    {
        if ($PSCmdlet.ShouldProcess("remove old backups at $($BackupDestination)"))
        {
            Get-ChildItem -Path $BackupDestination -Recurse -Force | Where-Object {-not $_.PSIsContainer -and $_.LastWriteTime -lt (Get-Date).AddDays( - $($Retention))} | Remove-Item -Force        
        }
    }
}