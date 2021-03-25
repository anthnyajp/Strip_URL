#Path to URL import file. You may update to wherever your file is located
$file = "C:\Downloads\WebURLs.txt"

#Code to process URL and show results
 [System.Uri[]](Get-Content $file) | Select-Object -Property Host 
