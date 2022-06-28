#Get Current ComputerName
$computer = $env:computername
$Date = Get-Date -Format "dddd MM/dd/yyyy HH:mm K"

$CurrentUser= $env:username

# Prepare to post to Flow
$body = ConvertTo-JSON @{Device = $computer; User = $CurrentUser; Date = $Date}
# write-output $body

# Flow path
$URI ="https://prod-106.westeurope.logic.azure.com:443/workflows/80cb821832074bcbbdb66848a87a2884/triggers/manual/paths/invoke?api-version=2016-06-01&sp=%2Ftriggers%2Fmanual%2Frun&sv=1.0&sig=EgAptS0t2CXawfaG5XFWhwOszCWnBT-ioLhXBoY56ig"

Invoke-RestMethod -uri $URI -Method Post -body $body -ContentType 'application/json'