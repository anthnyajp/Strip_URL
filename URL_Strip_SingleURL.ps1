#URL that you want to process
$URL = "http://www.google.com"

#Code to process URL
$Authority= ([System.Uri]$URL = $URL).Authority -replace '^www\.'
$URIextract =  ([uri] $URL | Select-Object -Property Scheme, Port, Host, @{Name="No-WWW";Expression={$Authority}}, OriginalString, LocalPath, Query, HostNameType, IsDefaultPort, IsFile, IsLoopback, PathAndQuery, Segments) 
$URIextract | Format-Table -AutoSize -Wrap -ErrorAction SilentlyContinue
