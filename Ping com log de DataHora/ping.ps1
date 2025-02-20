param(
    [string]$ip
)

$path = (Get-Location).path
$logFile = Join-Path -Path $path -ChildPath "$ip-log_$(Get-Date -Format 'yyyy-MM-dd_HH-mm-ss').log"

Start-Transcript -Path $logFile

ping -t $ip | ForEach-Object {
    $data = Get-Date -Format "dddd MM/dd/yyyy HH:mm:ss"
    "$_ - $data"
}

Stop-Transcript
