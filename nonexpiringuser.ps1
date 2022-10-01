Function Get-EnabledNonExpiringUser {
    Get-ADUser -filter {(Enabled -eq $true) -and `
                        (PasswordNeverExpires -eq $false)} `
               -properties Name, PasswordNeverExpires, `
                           PasswordExpired, PasswordLastSet, EmailAddress |
    Where-Object { $_.passwordexpired -eq $false }
  }