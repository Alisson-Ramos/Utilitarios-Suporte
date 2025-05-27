# Utilitários de Suporte Windows

Uma coleção de scripts em PowerShell e Batch para automação de tarefas comuns de suporte e manutenção em ambiente Windows.

---

## Índice

* [Sobre](#sobre)
* [Pré-requisitos](#pré-requisitos)
* [Instalação](#instalação)
* [Uso](#uso)

  * [Backup do Sistema](#backup-do-sistema)
  * [Executar MRT em Rede](#executar-mrt-em-rede)
  * [Limpeza de Temporários de Usuários](#limpeza-de-temporários-de-usuários)
  * [Patch Excel](#patch-excel)
  * [Ping com log de DataHora](#ping-com-log-de-datahora)
  * [RDS – Controle de Acesso Remoto](#rds--controle-de-acesso-remoto)
  * [Reiniciar Serviço Windows Update](#reiniciar-serviço-windows-update)
  * [Shutdown Forçado](#shutdown-forçado)
  * [Windows Update Forçado](#windows-update-forçado)
* [Contribuindo](#contribuindo)
* [Licença](#licença)
* [Contato](#contato)

---

## Sobre

Este repositório agrega diversos **utilitários** destinados a facilitar o trabalho de suporte e administração de estações e servidores Windows, automatizando desde backup até limpeza de arquivos temporários, passando por operações remotas como MRT, RDS, Windows Update, e muito mais.

---

## Pré-requisitos

* **Windows PowerShell** ≥ 3.0
* Permissão de **Administrador** para a maioria dos script
* Para scripts de Batch (`*.bat`), nenhum pré-requisito extra além do Windows padrão

---

## Instalação

1. Clone este repositório:

   ```powershell
   git clone https://github.com/Alisson-Ramos/Utilitarios-de-Suporte-Windows.git
   ```
2. Navegue até a pasta de um dos scripts e execute conforme descrito em [Uso](#uso).

---

## Uso

Cada pasta abaixo contém um script principal (PowerShell `.ps1` ou Batch `.bat`) e, quando aplicável, um arquivo de exemplo de parâmetros.

> **Dica:** Antes de executar, habilite a execução de scripts no PowerShell (somente uma vez):
>
> ```powershell
> Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
> ```

---

### Backup do Sistema

**Objetivo:** Criar backup de pastas críticas (Documentos, Desktop, etc.) para um destino definido.

```powershell
cd "Utilitarios-de-Suporte-Windows/Backup do Sistema"
.\Backup-Sistema.ps1 -Fonte "C:\Users" -Destino "D:\Backups\Users" -Compressao "zip"
```

---

### Executar MRT em Rede

**Objetivo:** Disparar o Microsoft Malicious Removal Tool (MRT) em diversos hosts, coletando log de execução.

```powershell
cd "Utilitarios-de-Suporte-Windows/Executar MRT em Rede"
.\Executar-MRT-Rede.ps1 -Computadores ".\hosts.txt" -Output ".\Logs\MRT"
```

---

### Limpeza de Temporários de Usuários

**Objetivo:** Limpar pastas temporárias de todos os perfis de usuário na máquina local.

```powershell
cd "Utilitarios-de-Suporte-Windows/Limpeza de Temporários de Usuários"
.\Limpar-Temporarios.ps1 -DryRun:$false
```

---

### Patch Excel

**Objetivo:** Aplicar correções de registro ou configurações para resolver falhas conhecidas no Excel.

```bat
cd "Utilitarios-de-Suporte-Windows/Patch Excel"
Patch-Excel.bat
```

---

### Ping com log de DataHora

**Objetivo:** Monitorar conectividade via ping e adicionar timestamp a cada linha de log.

```bat
cd "Utilitarios-de-Suporte-Windows/Ping com log de DataHora"
PingLog.bat 8.8.8.8 >> "C:\Logs\ping-$(Get-Date -Format yyyyMMdd).log"
```

---

### RDS – Controle de Acesso Remoto

**Objetivo:** Gerenciar acesso RDS (Remote Desktop Services) para usuários específicos.

```powershell
cd "Utilitarios-de-Suporte-Windows/RDS/ Controle de Acesso Remoto de Usuários"
.\Controle-RDS.ps1 -Usuario "joao.silva" -Habilitar $true
```

---

### Reiniciar Serviço Windows Update

**Objetivo:** Reiniciar o serviço Windows Update e limpar cache de atualizações.

```powershell
cd "Utilitarios-de-Suporte-Windows/Reiniciar Serviço Windows Update"
.\Reiniciar-WindowsUpdate.ps1
```

---

### Shutdown Forçado

**Objetivo:** Forçar o desligamento imediato da máquina.

```bat
cd "Utilitarios-de-Suporte-Windows/Shutdown Forçado"
Shutdown-Force.bat /f /t 0
```

---

### Windows Update Forçado

**Objetivo:** Forçar a detecção, download e instalação de atualizações pendentes.

```powershell
cd "Utilitarios-de-Suporte-Windows/Windows Update Forçado"
.\WindowsUpdate-Force.ps1 -AutoReboot:$true
```

---

## Contribuindo

1. Fork este repositório
2. Crie uma branch com sua feature: `git checkout -b feature/nome-da-feature`
3. Commit suas alterações: `git commit -m "Adiciona nova feature"`
4. Envie para sua branch remota: `git push origin feature/nome-da-feature`
5. Abra um Pull Request

---

## Contato

Alisson Ramos – [alisson.r.santos92@gmail.com](mailto:alisson.r.santos92@gmail.com)
Projeto no GitHub: [Alisson-Ramos/Utilitarios-de-Suporte-Windows](https://github.com/Alisson-Ramos/Utilitarios-de-Suporte-Windows)
