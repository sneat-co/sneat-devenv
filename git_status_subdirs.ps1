function Invoke-GitStatusSubdirs {
    param (
        [Parameter(Mandatory = $true)]
        [string]$Directory
    )

    $ErrorActionPreference = "Stop"  # Stop script execution on error

    # Get immediate subdirectories in the given directory
    $subdirectories = Get-ChildItem -Directory -Path $Directory

    $currentDirectory = Get-Location

    # Loop through each subdirectory and perform git pull
    foreach ($subdirectory in $subdirectories) {
        Set-Location -Path $subdirectory.FullName

        # Check if the current directory is a git repository
        if (Test-Path -Path ".git" -PathType Container) {

            $uncommittedChanges = git status --porcelain

            $unpushedChanges = git log --branches --not --remotes

            if ($uncommittedChanges -or $unpushedChanges) {
                if ($uncommittedChanges) {
                    Write-Host "Uncommitted changes found in $($subdirectory)"
                    Write-Host $uncommittedChanges
                }
                if ($unpushedChanges) {
                    Write-Host "Unpushed changes found in $($subdirectory)"
                    Write-Host $unpushedChanges
                }
            } else {
                Write-Host "No changes in $($subdirectory)"
            }
        }
    }

    Set-Location -Path $currentDirectory
}

# Get the full path of the script
$scriptPath = $MyInvocation.MyCommand.Path

# Get the directory of the script
$scriptDirectory = Split-Path -Path $scriptPath -Parent

# Check if the script is being executed directly from the console
if ($scriptPath -eq (Join-Path $scriptDirectory "git_status_subdirs.ps1")) {
    # If executed directly, call the function with the provided argument
    $directory = $args[0]
    Invoke-GitStatusSubdirs -Directory $directory
}
