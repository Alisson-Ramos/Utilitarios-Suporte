$lstMaquinas = ""
$caminhoDeLog = ""
$usuario = ""
$senha = ""

$ConteudoArquivo = Get-Content -Path $lstMaquinas
foreach ($Maquina in $ConteudoArquivo) {
    try{
        $startMessage = "Início $Maquina : " + (Get-Date)
        Write-Host $startMessage -ForegroundColor Cyan
        psexec \\$Maquina -accepteula -s -u $usuario -p $senha PowerShell.exe -windowstyle hidden -Command ("Start-Process -FilePath 'C:\Windows\System32\MRT.exe' -ArgumentList /quiet, /F:Y; (Get-Process -Name 'MRT').ProcessorAffinity=0x0003; exit")
        $endMessage = "Fim em: " + (Get-Date)
        Write-Host $endMessage -ForegroundColor Cyan
    } 
    catch {
        $errorMessage = $_.Exception.Message
        Write-Host $errorMessage -ForegroundColor Red
    } 
}

Start-Sleep 6100

foreach ($Maquina in $ConteudoArquivo) {
    $caminhoLogWindir="\\$Maquina\C$\Windows\debug"

    try{
        net use $caminhoLogWindir /user:$usuario $senha 
        copy  "$caminhoLogWindir\mrt.log" "\\$caminhoDeLog\mrt_log_$Maquina-$(Get-Date -Format 'yyyy-MM-dd_HH-mm-ss').log"
        $startMessage = "Copiando Logs:" + (Get-Date)
        Write-Host $startMessage -ForegroundColor Cyan
        net use $caminhoLogWindir /delete
    } 
    catch {
        $errorMessage = $_.Exception.Message
        Write-Host $errorMessage -ForegroundColor Red
    } 
    finally {
        net use $caminhoLogWindir /delete
    }
}
