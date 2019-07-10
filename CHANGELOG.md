# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/)
and this project adheres to [Semantic Versioning](https://semver.org/).

## [1.0.1] - 10/07-2019

### Added

- Backup-VM
  - Add link to online version of help.
- New cmdlet
  - Remove-VMBackup - remove old backups of your VMs.
- Add Pester test of PSScriptAnalyzer rules.

### Changed

- Backup-VM
  - Change parameter BackupDestination --> Destination.
  - Split the end section into its own cmdlet --> Remove-VMBackup.
  - Parameter *Compress* changed to --> *NoCompression*. Default is now
  backups are compressed.

### Removed

- Backup-VM
  - Removed parameter *Retention* as the functionality of removing old backups
  is moved to the new cmdlet Remove-VMBackup.

## [1.0.0] - 04/07-2019

### Added

- Initial version.
