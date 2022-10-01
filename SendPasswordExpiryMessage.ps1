function Send-PasswordExpiryMessageToUser {
    [CmdletBinding()]
    Param(
        [Paramter(ValueFromPipeline=$True)]
        [object[]]$InputObject,

        [Parameter(Mandatory=$True)]
        [string]$From,

        [Parameter(Mandatory=$True)]
        [string]$smtpServer
    )
    BEGIN {

    }
    PROCESS {
        ForEach ($user in $InputObject) {
            $subject = "Password expires $($user.UserMessage)"
            $body = @"
                Dear $($user.name),

                Your password will expire $($user.UserMessage).
                Please change it.

                Love, the Help Desk. 
"@

            if ($PSCmdlet.ShouldProcess("send expiry notice",`
                "$($user.name) who expires $($user.usermessage)")) {
                    Send-MailMessage -smtpServer $smtpServer `
                                     -from $from `
                                     -to $user.emailaddress `
                                     -subject $subject `
                                     -body $body `
                                     -priority High
            }

            Write-Output $user

        } #foreach
    } #process
} #function