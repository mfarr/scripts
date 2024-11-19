$extensions = @(
    ## Themes
    "pkief.material-icon-theme",
    "github.github-vscode-theme",

    ## Source Control
    "codezombiech.gitignore", # gitignore
    "huizhou.githd", # Git History Diff

    ## Language/Framework Support
    # Python
    "ms-python.python", # Python
    "ms-python.isort", # isort
    "ms-python.flake8", # Flake8
    "ms-python.black-formatter", # Black Formatter
    "ms-python.vscode-pylance", # Pylance
    
    # Javascript/Typescript
    "angular.ng-template", # Angular Language Service
    "esbenp.prettier-vscode", # Prettier
    "dbaeumer.vscode-eslint", # ESLint
    "christian-kohler.npm-intellisense", # npm Intellisense
    "orta.vscode-jest", # Jest
    
    # C#
    "ms-dotnettools.vscodeintellicode-csharp", # IntelliCode for C# Dev Kit
    "ms-dotnettools.csdevkit", # C# Dev Kit
    
    # Other
    "tamasfe.even-better-toml", # Even Better TOML
    "redhat.vscode-yaml", # YAML
    "ms-vscode.powershell", # PowerShell
    # "golang.go", # Go
    # "rust-lang.rust-analyzer", # Rust Analyzer
    # "vadimcn.vscode-lldb", # CodeLLDB

    # Copilot/Completion
    "visualstudioexptteam.vscodeintellicode", # IntelliCode
    "visualstudioexptteam.vscodeintellicode-completions", # IntelliCode Completions
    "github.copilot", # GitHub Copilot
    "github.copilot-chat", # GitHub Copilot Chat

    ## Environment
    "editorconfig.editorconfig", # EditorConfig for VS Code
    "usernamehw.errorlens", # Error Lens
    "alefragnani.project-manager", # Project Manager
    "wayou.vscode-todo-highlight", # TODO Highlight
    "ms-azuretools.vscode-docker", # Docker
    "ms-vscode-remote.remote-containers", # Dev Containers
    "ms-vscode-remote.remote-ssh", # Remote - SSH
    "ms-vscode-remote.remote-ssh-edit", # Remote - SSH: Editing Configuration Files
    "amazonwebservices.aws-toolkit-vscode" # AWS Toolkit
)

$command = "code"

If ($null -eq (Get-Command -Name $command -ErrorAction SilentlyContinue)) {
    throw "'$command' command not found!"
}

$extensions.ForEach({
    &$command --install-extension $_ | Out-Host
})
