Import-Csv -Path "C:\config\users.csv" | ForEach-Object {
    $username = ($_.nom + "." + $_.prénom).ToLower()
    $password = ConvertTo-SecureString "Azerty_2025!" -AsPlainText -Force

    if (-not (Get-ADUser -Filter "SamAccountName -eq '$username'")) {
        New-ADUser -Name $username `
                   -GivenName $_.prénom `
                   -Surname $_.nom `
                   -SamAccountName $username `
                   -UserPrincipalName "$username@laplateforme.io" `
                   -AccountPassword $password `
                   -PasswordNeverExpires $false `
                   -ChangePasswordAtLogon $true `
                   -Enabled $true
    }

    $groups = @($_.groupe1, $_.groupe2, $_.groupe3, $_.groupe4, $_.groupe5, $_.groupe6) | Where-Object { $_ -and $_.Trim() -ne "" }

    foreach ($group in $groups) {
        if (-not (Get-ADGroup -Filter "Name -eq '$group'")) {
            New-ADGroup -Name $group -GroupScope Global -GroupCategory Security
        }
        Add-ADGroupMember -Identity $group -Members $username
    }
}
