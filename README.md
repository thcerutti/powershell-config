# 🚀 Configuração do PowerShell (Zsh-Style)

Este guia contém os passos para transformar o terminal do Windows/PowerShell em uma experiência próxima ao Zsh do Linux, com autocompletar inteligente, ícones e sugestões de comandos.

## 1. Instalação dos Módulos Necessários

Abra o PowerShell e execute os comandos abaixo para instalar as extensões de autocompletar, ícones e integração:

```powershell
# Suporte avançado para Git (Branch, Status, Autocomplete)
Install-Module -Name posh-git -Scope CurrentUser -Force

# Preditor de comandos (IntelliSense para módulos instalados)
Install-Module -Name CompletionPredictor -Scope CurrentUser -Force

# Autocompletar inteligente para Docker
Install-Module -Name DockerCompletion -Scope CurrentUser -Force

# Ícones coloridos para arquivos e pastas no terminal
Install-Module -Name Terminal-Icons -Scope CurrentUser -Force

```

---

## 2. Configurando o Perfil (`$PROFILE`)

O arquivo de perfil é o "script" que o PowerShell executa toda vez que é aberto.

1. No terminal, digite: `notepad $PROFILE`
2. Cole o conteúdo abaixo e salve o arquivo:

```powershell
# --- 1. Opções de Previsão e Visualização ---
# Habilita o histórico e os plugins para sugerir comandos (texto cinza)
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle InlineView

# --- 2. Teclas de Atalho (Produtividade) ---
# TAB: Aceita a sugestão cinza ou abre o menu visual de opções (estilo Zsh)
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

# CTRL + SETA DIREITA: Aceita a sugestão palavra por palavra
Set-PSReadLineKeyHandler -Key "Ctrl+RightArrow" -Function AcceptNextSuggestionWord

# SETA PARA CIMA/BAIXO: Filtra o histórico pelo que você já começou a digitar
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# --- 3. Importação de Módulos ---
Import-Module posh-git
Import-Module CompletionPredictor
Import-Module DockerCompletion
Import-Module Terminal-Icons

# --- 4. Autocomplete para Kubernetes (kubectl) ---
if (Get-Command kubectl -ErrorAction SilentlyContinue) {
    kubectl completion powershell | Out-String | Invoke-Expression
}

# --- 5. Inicialização do Tema (Oh My Posh) ---
# Certifique-se de que o Oh My Posh está instalado no sistema
oh-my-posh init pwsh | Invoke-Expression

```

---

## 3. Resumo de Funcionalidades e Atalhos

### Atalhos de Teclado

| Atalho | Ação |
| --- | --- |
| `Tab` | Aceita a sugestão atual ou abre o menu de seleção visual. |
| `Ctrl` + `→` | Aceita apenas a próxima palavra da sugestão. |
| `↑` / `↓` | Busca no histórico comandos que iniciam com o texto já digitado. |

### Visual e Ícones

* **Terminal-Icons:** Agora, ao digitar `ls` ou `dir`, você verá ícones específicos para cada tipo de arquivo (ex: ícone de engrenagem para `.json`, ícone de pasta, ícone do Docker para `Dockerfile`, etc.).
* **Oh My Posh:** Gerencia a barra de status (prompt) com informações de contexto.

---

## 4. Requisitos de Interface

Para que todos os ícones (do Oh My Posh, Git e Terminal-Icons) apareçam corretamente, é obrigatório utilizar uma **Nerd Font** nas configurações do seu Windows Terminal.

**Recomendações:**

* *MesloLGL Nerd Font*
* *Cascadia Code NF*
* *JetBrainsMono Nerd Font*
