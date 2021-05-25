#!/usr/bin/pwsh
[CmdletBinding()]
param (
    [Parameter()]
    [ValidateSet("start", "stop", IgnoreCase=$false)]
    [string]
    $action = "stop"
)

Import-Module -Name AWSPowerShell.NetCore

switch ($action) {
  start { 
    Get-EC2Instance | Start-EC2Instance 
  }
  stop { 
    Get-EC2Instance | Stop-EC2Instance -Force 
  }
}