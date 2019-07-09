function Remove-VMBackup {
    <#
    .SYNOPSIS
    Remove old backup files.

    .DESCRIPTION
    Choose how long you want to keep a backup of your VMs. This cmdlet looks
    at the age of the files in the folder specefied and deletes them if they are
    older than the set in the Retention parameter.

    .PARAMETER Destination
    Specify the location of the stored backups.

    .PARAMETER Retention
    Configure how long you want to keep the backups. Default is 30 days.

    .PARAMETER Force
    The Force parameter allows the user to skip the "Should Continue" box.

    .EXAMPLE
    Remove-VMBackup -Destination 'D:\Backup\Hyper-V' -Retention 21

    Removes any files older than 21 days in the directory D:\Backup\Hyper-V

    .NOTES
    Author: Frederik Hjorslev Poulsen

    .LINK
    https://hjorslev.github.io/HyperVBackup/Remove-VMBackup.html
    #>

    [CmdletBinding()]
    param (

        [Parameter(Mandatory = $true,
            ValueFromPipelineByPropertyName = $true)]
        [Alias('BackupDestination')]
        [string]$Destination,

        [Parameter(Mandatory = $false)]
        [int]$Retention = 30,

        [Parameter(Mandatory = $false)]
        [switch]$Force
    )

    process {
        $OldBackups = Get-ChildItem -Path $Destination -Recurse -Force | Where-Object -FilterScript { (((Get-Date)-$_.LastWriteTime) -gt (New-TimeSpan -Day $Retention)) }
        $RemoveOldSCMessage = @"
Do you want to remove any backups or files stored in $($Destination) older than $($Retention) days?
"@
        if ($null -ne $OldBackups) {
            if ($Force -or $PSCmdlet.ShouldContinue($RemoveOldSCMessage, 'Remove old backups?')) {
                foreach ($OldBackup in $OldBackups) {
                    Write-Verbose -Message "$($OldBackup) is older than $($Retention). Deleting file..."
                }

                $OldBackups | Remove-Item -Recurse -Force
            }
        }
    } # Process
} # Cmdlet