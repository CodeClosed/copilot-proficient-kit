param(
    [Parameter(Mandatory=$true)]
    [string]$TargetRepoPath
)

$ErrorActionPreference = "Stop"
$KitRoot = Split-Path -Parent $MyInvocation.MyCommand.Path

if (-not (Test-Path $TargetRepoPath)) {
    Write-Error "Target repository path does not exist: $TargetRepoPath"
}

Write-Host "Copying GitHub Copilot Proficient customization files to $TargetRepoPath ..." -ForegroundColor Cyan

$dirs = @(
    ".github\instructions",
    ".github\prompts",
    ".github\agents",
    ".github\skills\api-endpoint-scaffold",
    ".github\workflows",
    ".vscode"
)

foreach ($d in $dirs) {
    $fullDir = Join-Path $TargetRepoPath $d
    if (-not (Test-Path $fullDir)) {
        New-Item -ItemType Directory -Path $fullDir -Force | Out-Null
    }
}

Copy-Item "$KitRoot\.github\copilot-instructions.md" "$TargetRepoPath\.github\copilot-instructions.md" -Force
Copy-Item "$KitRoot\.github\instructions\testing.instructions.md" "$TargetRepoPath\.github\instructions\testing.instructions.md" -Force
Copy-Item "$KitRoot\.github\prompts\refactor.prompt.md" "$TargetRepoPath\.github\prompts\refactor.prompt.md" -Force
Copy-Item "$KitRoot\.github\prompts\review.prompt.md" "$TargetRepoPath\.github\prompts\review.prompt.md" -Force
Copy-Item "$KitRoot\.github\agents\architect.agent.md" "$TargetRepoPath\.github\agents\architect.agent.md" -Force
Copy-Item "$KitRoot\.github\skills\api-endpoint-scaffold\SKILL.md" "$TargetRepoPath\.github\skills\api-endpoint-scaffold\SKILL.md" -Force
Copy-Item "$KitRoot\.github\workflows\copilot-setup-steps.yml" "$TargetRepoPath\.github\workflows\copilot-setup-steps.yml" -Force
Copy-Item "$KitRoot\.github\mcp.json" "$TargetRepoPath\.github\mcp.json" -Force
Copy-Item "$KitRoot\.vscode\mcp.json" "$TargetRepoPath\.vscode\mcp.json" -Force
Copy-Item "$KitRoot\.vscode\settings.json" "$TargetRepoPath\.vscode\settings.json" -Force

Write-Host "Successfully installed Copilot custom instructions, prompts, agents, skills, and MCP config!" -ForegroundColor Green
