Function ConvertFrom-PSCredential
{
    [CmdletBinding()]
    Param(
            [Parameter(Mandatory=$True)]
            [PSCredential[]] $InputCredentials,

            [Parameter(ParameterSetName="CertStore", Mandatory=$True)]
            [String] $CertificateDN,

            [Parameter(ParameterSetName="CertPath", Mandatory=$True)]
            [ValidateScript({Test-Path $_ })]
            [String] $CertificatePath,

            [ValidateScript({Test-Path $_ -Type Container})]
            [String] $OutputPath
         )
    
    BEGIN
    {}
    PROCESS
    {
        Foreach ($InputCredential in $InputCredentials)
        {
            $PlainText = $InputCredential.Password | Get-SecureStringText
            Write-Verbose $Plaintext
            Try
            {
                If ($CertificateDN)
                {
                    $Msg = Protect-CmsMessage -Content $PlainText -To $CertificateDN -ErrorAction Stop
                }
                else
                {
                    $Msg = Protect-CmsMessage -Content $PlainText -To $CertificatePath    
                }
            }
            Catch
            {
                Throw "Error while protecting CMS Message: $_"
            }
            
            $CredObj = [PSObject]@{
                                        Username = $InputCredential.Username
                                        PasswordCipher = $Msg                                        
                                  }
            $credObj | Export-Clixml -Path "$((Get-Item -Path $outputpath).fullname)$($InputCredential.username).xml" -Force
        }
    }
    END
    {
        Write-Debug -Message "Exiting ConvertFrom-PSCredential, anything else?"
    }
}