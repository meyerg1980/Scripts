#create ldap connection
$ldapconnection = new-adfsldapserverconnection -hostname fs2 -port 6000 -sslmode non -authenticationmethod kerberos -credential (Get-Credential)

#map ldap attributes
$commonname = new-adfsldapattributetoclaimmapping -ldapattribute cn -claimtype http://schemas.xmlsoap.org/claims/commonname
$displayname = new-adfsldapattributetoclaimmapping -ldapattribute "displayname" -claimtype https://schemas.xmlsoap.org/ws/2005/05/identify/claims/name
$upn = new-adfsldapattributetoclaimmapping -ldapattribute upn -claimtype http://schemas.xmlsoap.org/ws/2005/os/identify/claims/upn

#add claims provider trust 
add-adfslocalclaimsprovidertrust -name "adfsldap" -identifier "urn:adfsldap" -type $ldapconnection  `
                                 -ldapserverconnection $ldapconnection -ldapauthenticationmethod basic  `
                                 -userobjectclass user -usercontainer "cn=roles,cn=adfsldap,dc=meyersec,dc=com" `
                                 -anchorclaimldapattribute userpricipalname  `
                                 -anchorclaimtype "http://schemas.xmlsoap.org/ws/2005/05/identity/claims/upn"   `
                                 -acceptancetransformrules "c:[] => issue(claim=c);"    `
                                 new-adfsldapattributetoclaimmapping @($commonname,$displayname,$upn)   `
                                 -enabled $true -organizationalaccountsuffix "meyersec.com"




set-adfssynproperties -role "primarycomputer" -primarycomputername fs2
test-adfsfarmbehaviorlevelraise
get-adfsfarminformation
invoke-adfsfarmbehaviorlevelraise
