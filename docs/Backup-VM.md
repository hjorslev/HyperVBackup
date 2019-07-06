---
external help file: HyperVBackup-help.xml
Module Name: HyperVBackup
online version:
schema: 2.0.0
---

# Backup-VM

## SYNOPSIS
Perform a backup of Hyper-V Virtual Machines.

## SYNTAX

```
Backup-VM [-Name] <String[]> [-BackupDestination] <String> [-Compress] [[-Retention] <Int32>] [-Force]
 [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Perform a backup of Hyper-V Virtual Machines.
This module exports Virtual Machines and compress them using 7zip.

## EXAMPLES

### EXAMPLE 1
```
Backup-VM -Name "GAME-01", "VPN-01" -BackupDestination 'D:\Backup\Hyper-V' -Retention 30
```

### EXAMPLE 2
```
Get-VM | Backup-VM
```

Backups all VMs on the Hyper-V host.

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

### -BackupDestination
Specify the location of the backup.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Compress
Specify if you want to compress the backup into a .7z file.

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

### -Retention
Configure how long you want to keep the backups.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: 30
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
Cmdlet must be executed from an elevated prompt.

## RELATED LINKS
