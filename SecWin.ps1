<#
.NOTES
    Author: its-ashu-otf
    Github: https://github.com/its-ashu-otf
    Version: 0.1
    About: This Utility is used to secure Windows
#>

Write-Host "   _____          _       ___     " -ForegroundColor Cyan
Write-Host "  / ___/___  ____| |     / (_)___ " -ForegroundColor Cyan
Write-Host "  \__ \/ _ \/ ___/ | /| / / / __ \" -ForegroundColor Cyan
Write-Host " ___/ /  __/ /__ | |/ |/ / / / / /" -ForegroundColor Cyan
Write-Host "/____/\___/\___/ |__/|__/_/_/ /_/ " -ForegroundColor Cyan
Write-Host "                                  " -ForegroundColor Cyan
Write-Host "     Windows Security Utility     " -ForegroundColor Magenta   
Write-Host "         By its-ashu-otf          " -ForegroundColor Green                                                                  
Write-Host "           version: 0.1           " -ForegroundColor Blue

# Function to check if the script is running as admin
function IsAdmin {
    <#
        .DESCRIPTION
        Checking for admin privileges...
    #>
    return ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")
}

# Function to check internet connectivity
function Test-InternetConnection {
    <#
        .DESCRIPTION
        Internet Connection Check...
    #>
    try {
        # Try to reach a known public server (Google DNS)
        $testConnection = Test-Connection -ComputerName "8.8.8.8" -Count 1 -Quiet
        return $testConnection
    } catch {
        return $false
    }
}

<#
        .SYNOPSIS
        Main script logic to call out all the functions and perform the required actions.

        .DESCRIPTION
        This function is the main script logic to call out all the functions and perform the required actions. 
        It checks for internet connectivity, admin privileges, and then proceeds with the required actions.

#>


# Main script logic
try {
    # Check internet connectivity
    if (-not (Test-InternetConnection)) {
        Write-Host "No internet connectivity detected. Please check your network connection."
        exit
    }

    # Check if running with admin privileges
    if (-not (IsAdmin)) {
        Write-Output "This script needs to be run as an administrator."
        Write-Host "Please restart this script with elevated privileges (Run as Administrator)." -ForegroundColor Yellow
        pause
        exit
    }

} catch {
    Write-Host "An error occurred: $_"
} 