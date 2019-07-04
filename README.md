# HyperVBackup

[![Build status](https://img.shields.io/appveyor/ci/hjorslev/HyperVBackup.svg?style=for-the-badge)](https://ci.appveyor.com/project/hjorslev/HyperVBackup)
[![PowerShellGallery Version](https://img.shields.io/powershellgallery/v/HyperVBackup.svg?style=for-the-badge)](https://www.powershellgallery.com/packages/HyperVBackup)
[![PowerShellGallery Downloads](https://img.shields.io/powershellgallery/dt/HyperVBackup.svg?style=for-the-badge)](https://www.powershellgallery.com/packages/HyperVBackup)

## Synopsis

HyperVBackup is a PowerShell module that allows users to backup VMs from a Hyper-V
host.

## Description

HyperVBackup is a PowerShell module that allows users to backup VMs from a Hyper-V
host. The backups can be stored in a directory or compressed to a .7z file.

## Installation of HyperVBackup

The module is published in the [PowerShell Gallery](https://www.powershellgallery.com/packages/SteamPS).

Run the following in an elevated prompt:

```powershell
Install-Module -Name HyperVBackup
```

## Using HyperVBackup

```powershell
Get-VM | Backup-VM -BackupDestination - 'D:\Backup'
```

Backups all VMs on a Hyper-V host.
