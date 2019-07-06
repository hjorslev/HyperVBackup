# HyperVBackup

[![Build status](https://img.shields.io/appveyor/ci/hjorslev/HyperVBackup.svg?style=for-the-badge)](https://ci.appveyor.com/project/hjorslev/HyperVBackup)
[![PowerShellGallery Version](https://img.shields.io/powershellgallery/v/HyperVBackup.svg?style=for-the-badge)](https://www.powershellgallery.com/packages/HyperVBackup)
[![PowerShellGallery Downloads](https://img.shields.io/powershellgallery/dt/HyperVBackup.svg?style=for-the-badge)](https://www.powershellgallery.com/packages/HyperVBackup)

## Synopsis

HyperVBackup is a PowerShell module that allows users to backup VMs from a Hyper-V
host.

## Description

HyperVBackup is a PowerShell module that allows users to backup VMs from a Hyper-V
host. The module backups can be stored in a directory or compressed to a .7z file.

Using the parameter -Retention the user can evaluate the age of the backups
each time the cmdlet is executed and delete old backups if necessary.

## Installation of HyperVBackup

The module is published in the [PowerShell Gallery](https://www.powershellgallery.com/packages/HyperVBackup).

Run the following in an elevated prompt:

```powershell
Install-Module -Name HyperVBackup
```

## Using HyperVBackup

```powershell
Get-VM | Backup-VM -BackupDestination - 'D:\Backup\Hyper-V'
```

Backups all VMs on a Hyper-V host.
