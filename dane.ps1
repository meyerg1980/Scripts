#create dane tlsa resource record
Add-DnsServerResourceRecord -CertificateAssociationData df530bac9fcd914c252c2fbdceddc6183d4ae8c680ad65f03e204861dd7b1c73 
                            -TLSA 
                            -certificateusage domainissuedcertificate 
                            -selector subjectpublickeyinfo 
                            -name _443._tcp_ww1 
                            -zonename meyersec.com 
                            -matchingtype Sha256hash
