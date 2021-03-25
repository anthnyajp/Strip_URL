#Path to URL import file and where to export the file. You may update these fields. 
$links = "C:\Downloads\WebURLs.txt"
$CSVPath = "C:\Downloads\URL_Stripped_"+$Date+".csv"

#Script to check URL's in bulk and export to CSV
get-content $links |
 Foreach { $link = $_; try 
 {
 $Authority= ([System.Uri]$URL = $link).Authority -replace '^www\.' 
 $output= ([System.uri]"$URL" | Select-Object -Property  AbsolutUri, Scheme, Port, Host, @{Name="No-WWW";Expression={$Authority}},Authority, OriginalString, DnsSafeHost, IdnHost ,IsAbsoluteUri, UserEscaped, UserInfo , Fragment, IsUnc, LocalPath, AbsolutePath, Query, HostNameType, IsDefaultPort, IsFile, IsLoopback, PathAndQuery, Segments) 
 $output 
 }Finally 
 {
 }
 }|Export-CSV -Path $CSVPath -NoTypeInformation
