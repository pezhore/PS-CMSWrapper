# CMSWrapper

# Introduction
Additional documentation can be found in this repo's [Docs Folder](./Docs).

Please note that the **Master** branch has the latest, ready-for-production version. The **release/stage** branch is the holding ground for master merges where integration testing will take place. Other branches with active development will be denoted by having a prefix ( **feature/**, **bugfix/**, **release/**, etc) followed by an unique identifier. Nothing is merged into **release/stage** branch without code review, and only code that passes testing in the **release/stage** branch will be merged into **master**.

## Features

## ToDo
* Create module for wrapping CMS Protect/Unprotect functionality for Credential Objects
* Testing

## Testing

## Contact Information
Author: Brian Marsh

## Installation
### One time setup
* Download/clone the repository
* Copy the CMSWrapper folder to a module path (e.g. `$env:USERPROFILE\Documents\WindowsPowerShell\Modules\`)
* Alternatively, in the PS-CMSWrapper folder use PSDeploy (`Invoke-PSDeploy -Path .\PSDeploy\`)

### Automated Install
* Assuming you have PowerShell v5 and a Nuget Repository configured, use the built in Module management (`Install-Module CMSWrapper`)

## Import the module.
`Import-Module CMSWrapper #Alternatively, Import-Module \\Path\To\CMSWrapper`

## Get commands in the module
`Get-Command -Module CMSWrapper`

## Get help
`Get-Help Invoke-CMSWrapper -Full`
`Get-Help about_CMSWrapper`