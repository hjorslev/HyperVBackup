function Backup-VM {
    <#
    .SYNOPSIS
    Performs a backup of one or more Hyper-V Virtual Machines.

    .DESCRIPTION
    Performs a backup of one or more Hyper-V Virtual Machines. This module exports Virtual Machines and compress them using 7zip.

    .PARAMETER Name
    Name of the Virtual Machine. You can get a list of your Hyper-V machines using Get-VM.

    .PARAMETER Destination
    Specify the location of the backup.

    .PARAMETER CompressionLevel
    Set the compression level of the archive.

    .PARAMETER CompressionMethod
    Set the compresseion method of the archive.

    .PARAMETER NoCompression
    Specify if you only want to export the VM and not archive it.

    .PARAMETER Force
    The Force parameter allows the user to skip the "Should Continue" box.

    .EXAMPLE
    Backup-VM -Name "GAME-01", "VPN-01" -Destination 'D:\Backup\Hyper-V'

    Backups two VMs (GAME-01 and VPN-01) to the destination 'D:\Backup\Hyper-V'.

    .EXAMPLE
    Get-VM | Backup-VM -BackupDestination 'D:\Backup\Hyper-V'

    Backups all VMs on the Hyper-V host to 'D:\Backup\Hyper-V'.

    .NOTES
    Author: Frederik Hjorslev Poulsen

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
            HelpMessage = 'Enter one or more Hyper-V virtual machine names seperated by commas.',
            Position = 0
        )]
        [string[]]$Name,

        [Parameter(Mandatory = $true,
            HelpMessage = 'Enter the backup destination.',
            Position = 1
        )]
        [Alias('BackupDestination')]
        [string]$Destination,

        [Parameter(Mandatory = $false)]
        [ValidateSet('None', 'Fast', 'Low', 'Normal', 'High', 'Ultra')]
        [string]$CompressionLevel = 'Normal',

        [Parameter(Mandatory = $false)]
        [ValidateSet('Copy', 'Deflate', 'Deflate64', 'BZip2', 'Lzma', 'Lzma2', 'Ppmd', 'Default')]
        [string]$CompressionMethod = 'Default',

        [Parameter(Mandatory = $false)]
        [switch]$NoCompression,

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
            Write-Verbose -Message "Backup destination: $($Destination)."
            $TimeStamp = Get-Date -Format "yyyy-MM-dd-HHmm"

            # Exporting the VM.
            Export-VM -Name $Name -Path "$($Destination)\$($Name)-$($TimeStamp)"

            if (-not $NoCompression) {
                # Splat with parameters
                $CompressParameters = @{
                    'Path'            = "$($Destination)\$($Name)-$($TimeStamp)";
                    'ArchiveFileName' = "$($Destination)\$($Name)-$($TimeStamp).7z"
                }

                # Add CompressionLevel to the splat if variable is populated.
                if ($null -ne $CompressionLevel) {
                    Write-Verbose -Message "CompressionLevel set to $($CompressionLevel)."

                    $CompressParameters += @{
                        'CompressionLevel' = $CompressionLevel
                    }
                }

                # Add CompressionMethod to the splat if variable is populated.
                if ($null -ne $CompressionMethod) {
                    Write-Verbose -Message "CompressionMethod set to $($CompressionMethod)."
                    $CompressParameters += @{
                        'CompressionMethod' = $CompressionMethod
                    }
                }

                # Compress the exported VM using 7Zip4PowerShell if the parameter is set.
                Write-Verbose -Message 'Backup will be compressed to a .7z archive.'
                Compress-7Zip @CompressParameters

                # Remove the exported folder as it's now compressed.
                Remove-Item -Path "$($Destination)\$($Name)-$($TimeStamp)" -Force -Recurse
            }
        } # ShouldContinue
    } # Process
} # Cmdlet