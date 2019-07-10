---
external help file: HyperVBackup-help.xml
Module Name: HyperVBackup
online version: https://hjorslev.github.io/HyperVBackup/Remove-VMBackup.html
schema: 2.0.0
---

# Remove-VMBackup

## SYNOPSIS
Remove old backup files.

## SYNTAX

```
Remove-VMBackup [-Destination] <String> [[-Retention] <Int32>] [-Force] [-WhatIf] [-Confirm]
 [<CommonParameters>]
```

## DESCRIPTION
Choose how long you want to keep a backup of your VMs.
This cmdlet looks
at the age of the files in the folder specefied and deletes them if they are
older than the set in the Retention parameter.

## EXAMPLES

### EXAMPLE 1
```
Remove-VMBackup -Destination 'D:\Backup\Hyper-V' -Retention 21
```

Removes any files older than 21 days in the directory D:\Backup\Hyper-V

## PARAMETERS

### -Destination
Specify the location of the stored backups.

```yaml
Type: String
Parameter Sets: (All)
Aliases: BackupDestination

Required: True
Position: 1
Default value: None
Accept pipeline input: True (ByPropertyName, ByValue)
Accept wildcard characters: False
```

### -Retention
Configure how long you want to keep the backups.
Default is 30 days.

```yaml
Type: Int32
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
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
Author: Frederik Hjorslev Poulsen

## RELATED LINKS

[https://hjorslev.github.io/HyperVBackup/Remove-VMBackup.html](https://hjorslev.github.io/HyperVBackup/Remove-VMBackup.html)

