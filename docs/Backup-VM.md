---
external help file: HyperVBackup-help.xml
Module Name: HyperVBackup
online version: https://hjorslev.github.io/HyperVBackup/Backup-VM.html
schema: 2.0.0
---

# Backup-VM

## SYNOPSIS
Performs a backup of one or more Hyper-V Virtual Machines.

## SYNTAX

```
Backup-VM [-Name] <String[]> [-Destination] <String> [-CompressionLevel <String>] [-CompressionMethod <String>]
 [-NoCompression] [-Force] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Performs a backup of one or more Hyper-V Virtual Machines.
This module exports Virtual Machines and compress them using 7zip.

## EXAMPLES

### EXAMPLE 1
```
Backup-VM -Name "GAME-01", "VPN-01" -Destination 'D:\Backup\Hyper-V'
```

Backups two VMs (GAME-01 and VPN-01) to the destination 'D:\Backup\Hyper-V'.

### EXAMPLE 2
```
Get-VM | Backup-VM -BackupDestination 'D:\Backup\Hyper-V'
```

Backups all VMs on the Hyper-V host to 'D:\Backup\Hyper-V'.

## PARAMETERS

### -Name
Name of the Virtual Machine.
You can get a list of your Hyper-V machines using Get-VM.

```yaml
Type: String[]
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Destination
Specify the location of the backup.

```yaml
Type: String
Parameter Sets: (All)
Aliases: BackupDestination

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -CompressionLevel
Set the compression level of the archive.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: Normal
Accept pipeline input: False
Accept wildcard characters: False
```

### -CompressionMethod
Set the compresseion method of the archive.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: Default
Accept pipeline input: False
Accept wildcard characters: False
```

### -NoCompression
Specify if you only want to export the VM and not archive it.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -Force
The Force parameter allows the user to skip the "Should Continue" box.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Author: Frederik Hjorslev Poulsen

Cmdlet must be executed from an elevated prompt.

## RELATED LINKS

[https://hjorslev.github.io/HyperVBackup/Backup-VM.html](https://hjorslev.github.io/HyperVBackup/Backup-VM.html)

