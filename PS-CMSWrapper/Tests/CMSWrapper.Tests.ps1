# This module's name
$ModuleName = "CMSWrapper"

# Get this instance of PowerShell's major version
$PSVersion = $PSVersionTable.PSVersion.Major

#Force Import this repo's module
Import-Module $PSScriptRoot\..\$ModuleName\$ModuleName.psm1 -Force

# Specify ScriptAnalyzer rules to exclude when testing
$RulesToExclude = ""

## Begin our tests!

Describe "Should pass Script Analyzer PS$PSVersion Integrations tests" {
    Context 'Strict mode' {

        Set-StrictMode -Version latest

        It 'Should have no output from Script Analyzer' {

            # If we have specified rules, exclude them
            if ($RulesToExclude)
            {
                $Output = Invoke-ScriptAnalyzer -Path $PSScriptRoot\..\$ModuleName -Recurse -ExcludeRule $RulesToExclude
            }
            else
            {
                $Output = Invoke-ScriptAnalyzer -Path $PSScriptRoot\..\$ModuleName -Recurse
            }
            $Output -eq $null | Should be $true
        }
    }
}
