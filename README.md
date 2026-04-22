# 🚀 Configuração do PowerShell (Zsh-Style)

Este repositório contém os arquivos de configuração para transformar o terminal do Windows/PowerShell em uma experiência próxima ao Zsh do Linux, com autocompletar inteligente, ícones, sugestões de comandos e um prompt moderno via **Starship**.

## Arquivos do Repositório

| Arquivo | Descrição |
| --- | --- |
| `Microsoft.PowerShell_profile.ps1` | Perfil do PowerShell — carregado automaticamente a cada sessão. |
| `starship.toml` | Configuração do prompt Starship com ícones Nerd Font. |

---

## 1. Pré-requisitos

### Instalar o Starship

```powershell
winget install Starship.Starship
```

### Instalar o Neovim (editor padrão configurado no perfil)

```powershell
winget install Neovim.Neovim
```

### Instalar o Chocolatey (opcional, para autocompletar `choco`)

Siga as instruções em: https://chocolatey.org/install

---

## 2. Instalação dos Módulos PowerShell

Abra o PowerShell e execute:

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

## 3. Aplicando o Perfil (`$PROFILE`)

O arquivo `Microsoft.PowerShell_profile.ps1` deste repositório deve ser copiado (ou referenciado) para o caminho do seu perfil PowerShell.

```powershell
# Verifique o caminho do seu perfil
echo $PROFILE

# Copie o arquivo para o caminho correto
Copy-Item .\Microsoft.PowerShell_profile.ps1 $PROFILE
```

---

## 4. Configurando o Starship

Copie o arquivo `starship.toml` para o diretório de configuração do Starship:

```powershell
Copy-Item .\starship.toml "$env:USERPROFILE\.config\starship.toml"
```

O `starship.toml` deste repositório inclui configurações para:

* Símbolos customizados para Git (branch, status, commits)
* Ícones Nerd Font para linguagens: .NET, Node.js, Python, Go, Rust, Lua, C/C++
* Suporte a Kubernetes, Docker, Terraform, AWS, Azure e GCloud
* Símbolos de sistema operacional e informações de bateria/memória

---

## 5. Resumo de Funcionalidades

### Atalhos de Teclado

| Atalho | Ação |
| --- | --- |
| `Tab` | Aceita a sugestão atual ou abre o menu de seleção visual. |
| `Ctrl` + `→` | Aceita apenas a próxima palavra da sugestão. |
| `↑` / `↓` | Busca no histórico comandos que iniciam com o texto já digitado. |

### Visual e Ferramentas

* **Starship:** Prompt moderno com informações de contexto (Git, linguagem, Kubernetes, cloud, etc.).
* **Terminal-Icons:** Ao digitar `ls` ou `dir`, exibe ícones específicos por tipo de arquivo.
* **posh-git:** Informações de branch e status Git no prompt.
* **CompletionPredictor:** Sugestões inteligentes de comandos baseadas no histórico e módulos instalados.
* **DockerCompletion:** Autocompletar para comandos Docker.
* **Chocolatey:** Autocompletar para o gerenciador de pacotes `choco` (se instalado).
* **kubectl:** Autocompletar para Kubernetes (se `kubectl` estiver instalado).
* **Neovim:** Definido como editor padrão (`$env:EDITOR = "nvim"`).

---

## 6. Requisitos de Interface

Para que todos os ícones (do Starship, Git e Terminal-Icons) apareçam corretamente, é obrigatório utilizar uma **Nerd Font** nas configurações do seu Windows Terminal.

**Recomendações:**

* *MesloLGL Nerd Font*
* *Cascadia Code NF*
* *JetBrainsMono Nerd Font*
