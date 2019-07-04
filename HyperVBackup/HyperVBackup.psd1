# Module manifest for module 'ModuleName'
#
# Generated by: hjorslev
#
# Generated on: DATE
#

@{

    # Script module or binary module file associated with this manifest.
    RootModule        = "HyperVBackup.psm1"

    # Version number of this module.
    ModuleVersion     = '1.0.0.0'

    # Supported PSEditions
    # CompatiblePSEditions = @()

    # ID used to uniquely identify this module
    GUID              = '5e1858f1-300b-4442-9b57-28cfe4a441ed'

    # Author of this module
    Author            = 'Frederik Hjorslev Poulsen'

    # Company or vendor of this module
    CompanyName       = 'hjorslev'

    # Copyright statement for this module
    Copyright         = "(c) 2019 hjorslev. All rights reserved."

    # Description of the functionality provided by this module
    Description       = "HyperVBackup takes a backup virtual machines hosted in Hyper-V.
    This is achived by exporting the VM and then, if chosen, compressed to a .7z archive."

    # Minimum version of the Windows PowerShell engine required by this module
    # PowerShellVersion = ''

    # Name of the Windows PowerShell host required by this module
    # PowerShellHostName = ''

    # Minimum version of the Windows PowerShell host required by this module
    # PowerShellHostVersion = ''

    # Minimum version of Microsoft .NET Framework required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
    # DotNetFrameworkVersion = ''

    # Minimum version of the common language runtime (CLR) required by this module. This prerequisite is valid for the PowerShell Desktop edition only.
    # CLRVersion = ''

    # Processor architecture (None, X86, Amd64) required by this module
    # ProcessorArchitecture = ''

    # Modules that must be imported into the global environment prior to importing this module
    RequiredModules   = @(
        @{
            ModuleName    = '7Zip4Powershell';
            GUID          = 'bd4390dc-a8ad-4bce-8d69-f53ccf8e4163';
            ModuleVersion = '1.9.0';
        }
    )

    # Assemblies that must be loaded prior to importing this module
    # RequiredAssemblies = @()

    # Script files (.ps1) that are run in the caller's environment prior to importing this module.
    # ScriptsToProcess = @()

    # Type files (.ps1xml) to be loaded when importing this module
    # TypesToProcess = @()

    # Format files (.ps1xml) to be loaded when importing this module
    # FormatsToProcess = @()

    # Modules to import as nested modules of the module specified in RootModule/ModuleToProcess
    # NestedModules = @()

    # Functions to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no functions to export.
    FunctionsToExport = @('')

    # Cmdlets to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no cmdlets to export.
    # CmdletsToExport   = @()

    # Variables to export from this module
    # VariablesToExport = '*'

    # Aliases to export from this module, for best performance, do not use wildcards and do not delete the entry, use an empty array if there are no aliases to export.
    # AliasesToExport   = @()

    # DSC resources to export from this module
    # DscResourcesToExport = @()

    # List of all modules packaged with this module
    # ModuleList = @()

    # List of all files packaged with this module
    # FileList = @()

    # Private data to pass to the module specified in RootModule/ModuleToProcess. This may also contain a PSData hashtable with additional module metadata used by PowerShell.
    PrivateData       = @{

        PSData = @{

            # Tags applied to this module. These help with module discovery in online galleries.
            Tags         = @('Hyper-V', 'Backup', 'Export', 'Virtual Machine')

            # A URL to the license for this module.
            LicenseUri   = "https://github.com/hjorslev/HyperVBackup/blob/master/LICENSE.md"

            # A URL to the main website for this project.
            ProjectUri   = "https://github.com/hjorslev/HyperVBackup"

            # A URL to an icon representing this module.a
            # IconUri = ''

            # ReleaseNotes of this module
            ReleaseNotes = "https://github.com/hjorslev/HyperVBackup/blob/master/CHANGELOG.md"

        } # End of PSData hashtable

    } # End of PrivateData hashtable

    # HelpInfo URI of this module
    # HelpInfoURI = ''

    # Default prefix for commands exported from this module. Override the default prefix using Import-Module -Prefix.
    # DefaultCommandPrefix = ''

}

