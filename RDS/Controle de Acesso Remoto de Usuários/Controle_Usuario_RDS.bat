@echo =========================================
@echo Criado por Alisson Santos
@echo ========================================
@echo off
:: Verifica se está rodando como administrador
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Solicitando permissao de administrador...
    powershell -Command "Start-Process cmd -ArgumentList '/c %~s0' -Verb RunAs"
    exit
)

title Acesso Remoto via Shadow
setlocal enabledelayedexpansion

:: Obtendo a lista de usuários conectados
echo Listando usuários conectados...
query user
echo.
set /p ID_USUARIO=Digite o ID do usuário que deseja acessar: 

:: Escolher tipo de acesso
echo.
echo Escolha o tipo de acesso:
echo [1] - Apenas Visualizar
echo [2] - Controle Total
set /p OPCAO=Digite a opcao desejada (1 ou 2): 

if "%OPCAO%"=="1" (
    mstsc /shadow:%ID_USUARIO% /noConsentPrompt
) else if "%OPCAO%"=="2" (
    mstsc /shadow:%ID_USUARIO% /noConsentPrompt /control
) else (
    echo Opcao invalida!
    pause
    exit
)

echo Conectando...
pause
