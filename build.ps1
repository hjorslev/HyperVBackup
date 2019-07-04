$ModuleAuthorName = 'Frederik Hjorslev Poulsen'
$ModuleName = 'HyperVBackup'

# Line break for readability in AppVeyor console
Write-Host -Object ''

# Make sure we're using the Master branch and that it's not a pull request
# Environmental Variables Guide: https://www.appveyor.com/docs/environment-variables/
if ($env:APPVEYOR_REPO_BRANCH -ne 'master') {
    Write-Warning -Message "Skipping version increment and publish for branch $env:APPVEYOR_REPO_BRANCH"
} elseif ($env:APPVEYOR_PULL_REQUEST_NUMBER -gt 0) {
    Write-Warning -Message "Skipping version increment and publish for pull request #$env:APPVEYOR_PULL_REQUEST_NUMBER"
} else {
    # We're going to add 1 to the revision value since a new commit has been merged to Master
    # This means that the major / minor / build values will be consistent across GitHub and the Gallery
    try {
        # This is where the module manifest lives
        $ManifestPath = ".\$ModuleName\$ModuleName.psd1"

        # Start by importing the manifest to determine the version, then add 1 to the revision
        $Manifest = Test-ModuleManifest -Path $ManifestPath
        [System.Version]$Version = $Manifest.Version
        Write-Output -InputObject "Old Version: $Version"
        [String]$NewVersion = New-Object -TypeName System.Version -ArgumentList ($Version.Major, $Version.Minor, $Version.Build, $env:APPVEYOR_BUILD_NUMBER)
        Write-Output -InputObject "New Version: $NewVersion"

        # Update the manifest with the new version value and fix the weird string replace bug
        $FunctionList = ((Get-ChildItem -Path .\$ModuleName\Public).BaseName)
        $Splat = @{
            'Path'              = $ManifestPath
            'ModuleVersion'     = '1.0.0.0'
            'FunctionsToExport' = $FunctionList
            'Copyright'         = "(c) 2019-$( (Get-Date).Year ) $ModuleAuthorName. All rights reserved."
        }

        Update-ModuleManifest @Splat
    } catch {
        throw $_
    }

    # Create new markdown and XML help files
    Write-Host -Object "Building new function documentation" -ForegroundColor Yellow
    Import-Module -Name "$PSScriptRoot\$ModuleName" -Force
    New-MarkdownHelp -Module $ModuleName -OutputFolder '.\docs\' -Force
    New-ExternalHelp -Path '.\docs\' -OutputPath ".\docs\en-US\" -Force
    . .\docs.ps1
    Write-Host -Object ''

    # Publish the new version to the PowerShell Gallery
    try {
        # Build a splat containing the required details and make sure to Stop for errors which will trigger the catch
        $PM = @{
            Path        = ".\$ModuleName"
            NuGetApiKey = $env:NuGetApiKey
            ErrorAction = 'Stop'
        }

        Publish-Module @PM
        Write-Host -Object "$ModuleName PowerShell Module version $NewVersion published to the PowerShell Gallery." -ForegroundColor Cyan
    } catch {
        # Sad panda; it broke
        Write-Warning -Message "Publishing update $NewVersion to the PowerShell Gallery failed."
        throw $_
    }

    # Publish the new version back to Master on GitHub
    try {
        # Set up a path to the git.exe cmd, import posh-git to give us control over git, and then push changes to GitHub
        # Note that "update version" is included in the appveyor.yml file's "skip a build" regex to avoid a loop
        $env:Path += ";$env:ProgramFiles\Git\cmd"
        Import-Module posh-git -ErrorAction Stop
        git checkout master
        git add --all
        git status
        git commit -s -m "Update version to $NewVersion"
        git push origin master
        Write-Host -Object "$ModuleName PowerShell Module version $NewVersion published to GitHub." -ForegroundColor Cyan
    } catch {
        # Sad panda; it broke
        Write-Warning "Publishing update $NewVersion to GitHub failed."
        throw $_
    }
}