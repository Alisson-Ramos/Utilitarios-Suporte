# Script Criado por Alisson Ramos 13/11/2024
# Script que cria backup do Sistema para Recuperação

# Defina o destino do backup e o caminho do diretório de backup
$backupTarget = "Caminho"
$computerName = $env:COMPUTERNAME
$backupPath = Join-Path $backupTarget "WindowsImageBackup\$computerName"

# Verifica e fecha o processo wbadmin se estiver em execução
function Check-WbAdmin-Process {
    $wbadminProcess = Get-Process -Name "wbengine" -ErrorAction SilentlyContinue
    if ($wbadminProcess) {
        Write-Host "O processo 'wbengine' está em execução. Finalizando o processo..." -ForegroundColor Yellow
        Stop-Process -Name "wbengine" -Force
        Write-Host "Processo 'wbengine' finalizado. aguarde...." -ForegroundColor Yellow
        
    } else {
        Write-Host "O processo 'wbadmin' não está em execução." -ForegroundColor Yellow
    }
    Start-Sleep -Seconds 5
}

# Função para iniciar o backup
function Start-Backup {
    try{
        Write-Host "Iniciando o backup..." -ForegroundColor Yellow
        wbadmin start backup -backupTarget:$backupTarget -include:C: -allCritical -quiet
    } catch { Write-Host "Erro ao realizar o backup." -ForegroundColor Red }
}

# Função para verificar a integridade do backup
function Verify-BackupIntegrity {
    Write-Host "Verificando a integridade do backup..."
    
    $backupStatus = wbadmin get status
    
    if ($backupStatus -contains "backup completed successfully") {
        Write-Host "Backup realizado com sucesso." -ForegroundColor Green
    
        Check-WbAdmin-Process
    } else { Write-Host "Erro na integridade do backup." -ForegroundColor Red }
}

Start-Backup

Verify-BackupIntegrity