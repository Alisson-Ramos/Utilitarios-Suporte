# =========================================
# Criado por Alisson Santos
# =========================================

# Correção de um bug que quando dois usuários ou mais tentasse abrir um determinado
# arquivo excel em rede, causava crash e impossibilitava o usuário com o excel crashado
# usar. Constato na build 26100 23H2/24H2

$windowsBuild = (Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion').CurrentBuild
 
if ($windowsBuild -ge 26100) {
    $excel = New-Object -ComObject Excel.Application
    $excel.Visible = $false
 
    # Monitoramento do EXCEL
    while ($true) {
        $excelProcess = Get-Process -Name EXCEL -ErrorAction SilentlyContinue
        if ($excelProcess -eq $null) {
            $excel = New-Object -ComObject Excel.Application
            $excel.Visible = $false
        }
        
        Start-Sleep -Seconds 5
    }
}