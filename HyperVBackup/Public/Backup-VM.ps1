function Backup-VM {
    <#
    .SYNOPSIS
    Perform a backup of Hyper-V Virtual Machines.

    .DESCRIPTION
    Perform a backup of Hyper-V Virtual Machines. This module exports Virtual Machines and compress them using 7zip.

    .PARAMETER Name
    Name of the Virtual Machine. You can get a list of your Hyper-V machines using Get-VM.

    .PARAMETER BackupDestination
    Specify the location of the backup.

    .PARAMETER Compress
    Specify if you want to compress the backup into a .7z file.

    .PARAMETER Retention
    Configure how long you want to keep the backups.

    .PARAMETER Force
    The Force parameter allows the user to skip the "Should Continue" box.

    .EXAMPLE
    Backup-VM -Name "GAME-01", "VPN-01" -BackupDestination 'D:\Backup\Hyper-V' -Retention 30

    .EXAMPLE
    Get-VM | Backup-VM -BackupDestination 'D:\Backup\Hyper-V'

    Backups all VMs on the Hyper-V host and store them for 30 days.

    .NOTES
    Cmdlet must be executed from an elevated prompt.

    .LINK
    https://hjorslev.github.io/HyperVBackup/Backup-VM.html

    #>

    [CmdletBinding(SupportsShouldProcess = $true,
        ConfirmImpact = 'Medium')]
    param
    (
        [Parameter(Mandatory = $true,
            ValueFromPipeline = $true,
            ValueFromPipelineByPropertyName = $true,
            HelpMessage = 'Enter one or more Hyper-V virtual machine names seperated by commas.'
        )]
        [string[]]$Name,

        [Parameter(Mandatory = $true,
            HelpMessage = 'Enter the backup destination.'
        )]
        [string]$BackupDestination,

        [Parameter(Mandatory = $false)]
        [switch]$Compress,

        [Parameter(Mandatory = $false)]
        [int]$Retention = 30,

        [Parameter(Mandatory = $false)]
        [switch]$Force
    )

    process {
        $BackupSCMessage = @"
Do you want to backup the following Hyper-V machine:
    $($Name)
"@
        if ($Force -or $PSCmdlet.ShouldContinue($BackupSCMessage, 'Backup Virtual Machine?')) {
            Write-Verbose -Message "Virtual machine to backup: $($Name)."
            Write-Verbose -Message "Backup destination: $($BackupDestination)."
            Write-Verbose -Message "Days to keep backup: $($Retention)."
            $TimeStamp = Get-Date -Format "yyyy-MM-dd-HHmm"

            # Exporting the VM.
            Export-VM -Name $Name -Path "$($BackupDestination)\$($Name)-$($TimeStamp)"

            if ($Compress) {
                # Compress the exported VM using 7Zip4PowerShell if the parameter is set.
                Compress-7Zip -Path "$($BackupDestination)\$($Name)-$($TimeStamp)" -ArchiveFileName "$($BackupDestination)\$($Name)-$($TimeStamp).7z"

                # Remove the exported folder as it's now compressed.
                Remove-Item -Path "$($BackupDestination)\$($Name)-$($TimeStamp)" -Force -Recurse
            }
        } # ShouldContinue
    } # Process

    end {
        $OldBackups = Get-ChildItem -Path $BackupDestination -Recurse -Force | Where-Object -FilterScript { -not $_.PSIsContainer -and (((Get-Date)-$_.LastWriteTime) -gt (New-TimeSpan -Day $Retention)) }
        $RemoveOldSCMessage = @"
Do you want to remove any backups older than $($Retention) days?
"@
        if ($null -ne $OldBackups) {
            if ($Force -or $PSCmdlet.ShouldContinue($RemoveOldSCMessage, 'Remove old backups?')) {
                $OldBackups | Remove-Item -Force
            }
        }
    } # End
} # Cmdlet