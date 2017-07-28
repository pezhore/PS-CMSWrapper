Function ConvertTo-PSCredential
{
    [CmdletBinding()]
    param(
            [ValidateScript({
                                If ($_.keys -contains "PasswordCipher" -and
                                    $_.keys -contains "Username"
                                   )
                                {
                                    $true
                                }
                                Else
                                {
                                    Throw "Object does not contain PasswordCipher and Username Keys."
                                }
                            })]
            [PSObject] $InputObject
         )
    BEGIN{}
    PROCESS
    {
        $Username = $InputObject.Username
        $PlainText = $InputObject.PasswordCipher | Unprotect-CmsMessage
        $Password  = $Plaintext | ConvertTo-SecureString -asPlainText -Force
        $PSCredential = New-Object -Type System.Management.Automation.PSCredential($username,$Password)

        Return $PSCredential
    }
    END
    {
        Write-Debug "Exiting ConvertTo-PSCredential, anything else?"
    }
}