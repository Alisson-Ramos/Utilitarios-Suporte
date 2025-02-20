# Script criado por Alisson Santos 12/11/2024 21:51
# Script de Limpeza de arquivos temporários do Windows (winver do código criado: W10 22H2)
# Obtém todos os perfis de usuários (ativos e inativos) na máquina
$users = Get-WmiObject -Class Win32_UserProfile | Where-Object { $_.Special -eq $false }

foreach ($user in $users) {
    # Caminho da pasta TEMP do usuário
    $tempPath = "$($user.LocalPath)\AppData\Local\Temp"
    
    if (Test-Path -Path $tempPath) {
        Write-Host "Limpando arquivos TEMP de $($user.LocalPath)" -ForegroundColor Cyan
        
        try {
            # Remove todos os arquivos e diretórios na pasta TEMP
            Remove-Item -Path "$tempPath\*" -Recurse -Force -ErrorAction SilentlyContinue
            Write-Host "Limpeza concluída para $($user.LocalPath)" -ForegroundColor Green
        } catch {
            Write-Host "Erro ao limpar $($user.LocalPath): $_" -ForegroundColor Red
        }
    } else {
        Write-Host "Pasta TEMP não encontrada para $($user.LocalPath)" -ForegroundColor Yellow
    }
}

Write-Host "Limpeza concluída para todos os usuários." -ForegroundColor Green

