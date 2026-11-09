# GitHub Copilot Proficient Kit

This repository contains the complete set of project customizations, agent definitions, prompt files, skills, MCP server configurations, and SDK/API integrations designed for **GitHub Copilot Verified Proficiency (Proficient Tier / Microsoft Pro Badge)**.

## Included Customizations

- [`.github/copilot-instructions.md`](.github/copilot-instructions.md) — Repository-wide custom instructions.
- [`.github/instructions/testing.instructions.md`](.github/instructions/testing.instructions.md) — Path-specific instructions (`applyTo: "**/*.{test,spec}.*"`).
- [`.github/prompts/refactor.prompt.md`](.github/prompts/refactor.prompt.md) — Reusable `/refactor` slash command prompt in Agent mode.
- [`.github/prompts/review.prompt.md`](.github/prompts/review.prompt.md) — Reusable `/review` slash command prompt in Ask mode.
- [`.github/agents/architect.agent.md`](.github/agents/architect.agent.md) — Custom `@architect` Copilot coding agent profile.
- [`.github/skills/api-endpoint-scaffold/SKILL.md`](.github/skills/api-endpoint-scaffold/SKILL.md) — Reusable Copilot Agent Skill.
- [`.vscode/mcp.json`](.vscode/mcp.json) — Model Context Protocol (MCP) server configuration (`filesystem` & `github` MCP servers).
- [`.vscode/settings.json`](.vscode/settings.json) — Enables Next-Edit Suggestions (NES), prompt files, instruction files, and MCP in VS Code.
- [`src/copilot-api-demo.mjs`](src/copilot-api-demo.mjs) — Integration script using the GitHub Copilot SDK / API across multiple models.

## Applying to Other Repositories

Run the included PowerShell script to copy all `.github` and `.vscode` Copilot customizations into any local repository:

```powershell
.\apply-to-repo.ps1 -TargetRepoPath "C:\path\to\your\repo"
```
