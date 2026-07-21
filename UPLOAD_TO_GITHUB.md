# Publish the BTP@MA Framework to GitHub

Target repository:

`https://github.com/rimbunanksasdnbhd-boop/AI-driven-development-process`

The package includes safe publishing scripts. They do not store a GitHub token. Authentication is handled by your existing Git Credential Manager or GitHub CLI session.

## Windows PowerShell

From the extracted package root:

```powershell
# Confirm GitHub authentication first.
git ls-remote https://github.com/rimbunanksasdnbhd-boop/AI-driven-development-process.git

# Review changes and confirm before pushing.
.\scripts\publish-to-github.ps1
```

To skip the final typed confirmation:

```powershell
.\scripts\publish-to-github.ps1 -Force
```

## macOS or Linux

```bash
git ls-remote https://github.com/rimbunanksasdnbhd-boop/AI-driven-development-process.git
./scripts/publish-to-github.sh
```

## Authentication

Recommended options:

1. Sign in through Git Credential Manager when Git prompts you.
2. Or authenticate through GitHub CLI:

```powershell
gh auth login
```

Do not put a personal access token in `.env`, a skill file, source code, or the Git remote URL.

## What the script does

1. Checks repository access.
2. Clones the target repository to a temporary directory.
3. Copies the complete framework package without `.git`, virtual environments, caches, or build output.
4. Shows the Git changes.
5. Requires confirmation unless `-Force` is supplied.
6. Commits and pushes to `main`.
7. Deletes the temporary local clone.

Existing target files with the same names are replaced. Files that are unrelated to the package are preserved.
