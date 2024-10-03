$ErrorActionPreference = "Stop"

$COMPARE_FOLDER = if ($args.Length -ge 2) { $args[1] } else { "../template" }

$files = @(
    "README.md",
    "HELP.md",
    ".gitignore",
    ".editorconfig",
    ".vscode/settings.json",
    ".devcontainer/post_create.sh",
    ".devcontainer/devcontainer.json",
    ".devcontainer/home/.zshrc",
    ".devcontainer/home/.zshenv",
    ".devcontainer/home/.gitconfig"
)

foreach ($file in $files) {
    # code --wait -d "$COMPARE_FOLDER/$file" "./$file"
    code -d "$COMPARE_FOLDER/$file" "./$file"
}

