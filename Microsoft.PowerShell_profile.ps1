# Define o Neovim como editor padrão para ferramentas de terminal
$env:EDITOR = "nvim"

# --- 1. Opções de Previsão e Visualização ---
# Usa o histórico e os plugins instalados para sugerir comandos
Set-PSReadLineOption -PredictionSource HistoryAndPlugin
Set-PSReadLineOption -PredictionViewStyle InlineView

# --- 2. Teclas de Atalho (Produtividade) ---
# Tab: Aceita a sugestão cinza ou abre o menu visual de opções
Set-PSReadLineKeyHandler -Key Tab -Function MenuComplete

# Ctrl + Seta Direita: Aceita a sugestão palavra por palavra
Set-PSReadLineKeyHandler -Key "Ctrl+RightArrow" -Function AcceptNextSuggestionWord

# Seta para cima/baixo: Filtra o histórico pelo que já foi digitado
Set-PSReadLineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadLineKeyHandler -Key DownArrow -Function HistorySearchForward

# --- 3. Importação de Módulos ---
Import-Module posh-git
Import-Module CompletionPredictor
Import-Module DockerCompletion

# --- 4. Autocomplete para Kubernetes (kubectl) ---
# Adiciona suporte se o kubectl estiver instalado
if (Get-Command kubectl -ErrorAction SilentlyContinue) {
    kubectl completion powershell | Out-String | Invoke-Expression
}

# --- 5. Inicialização do Tema (Oh My Posh) ---
# oh-my-posh init pwsh | Invoke-Expression
Invoke-Expression (&starship init powershell)

# terminal icon
Import-Module Terminal-Icons

# Import the Chocolatey Profile that contains the necessary code to enable
# tab-completions to function for `choco`.
# Be aware that if you are missing these lines from your profile, tab completion
# for `choco` will not function.
# See https://ch0.co/tab-completion for details.
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}
