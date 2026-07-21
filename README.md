# BTP@MA AI-Driven Development Framework

A Git-ready starter framework for controlled AI-assisted requirement analysis, solution design, test-script creation, coding, review, and verification.

**Visual guide:** open [`README.html`](README.html) locally, or publish [`index.html`](index.html) with GitHub Pages for a presentation-ready overview.

This repository adapts the discipline of the open-source **Superpowers** methodology to an enterprise BTP@MA delivery lifecycle. It adds mandatory input collection, four fixed specialist agents, human approval gates, traceability, controlled-tool boundaries, and SAP/Jira/GitHub-oriented extension points.

## Core rule

The framework must not start downstream work until the required source material is available.

| Workflow | Mandatory intake before work starts |
|---|---|
| Requirement analysis | Requirement input and product documentation |
| Test-script creation | Approved requirement/acceptance criteria, product documentation, and test-script template |
| Coding | Approved requirement, approved solution design, source repository/codebase, build command, test command, and coding standards |

A documented waiver can be used only where `config/intake-policy.yaml` explicitly permits it. The source code repository and approved development inputs cannot be waived for coding.

## Architecture

```mermaid
flowchart LR
    U[User / Jira / Product Owner] --> O[BTP@MA Orchestrator]
    O --> I[Intake Gate]
    I -->|Missing inputs| Q[Ask for documentation, template, or codebase]
    I -->|Ready| R{Workflow router}
    R --> P[Product Definition Agent]
    R --> S[Solution Agent]
    R --> D[Development Agent]
    R --> T[Quality Agent]
    P --> A[Human approval gates]
    S --> A
    D --> V[Independent review and verification]
    T --> V
    A --> V
    V --> X[Jira / GitHub / BTP delivery artifacts]
```

## Repository contents

- `skills/`: reusable agent skills in `SKILL.md` format
- `agents/`: fixed role definitions for the orchestrator and four specialist agents
- `config/`: intake, approval, tool, and agent policies
- `src/`: a small Python reference implementation of the intake gate and workflow router
- `schemas/`: JSON schemas for requests and traceability
- `templates/`: requirement, solution-design, test-case, and implementation-plan templates
- `requests/examples/`: ready-to-run request manifests
- `.cursor/rules/`, `AGENTS.md`, `CLAUDE.md`: harness entry instructions
- `.github/`: CI, issue templates, and pull-request controls

## Quick start

### 1. Install

```bash
python -m venv .venv
# Windows PowerShell
.venv\Scripts\Activate.ps1
# macOS/Linux
# source .venv/bin/activate

python -m pip install --upgrade pip
pip install -e ".[dev]"
```

### 2. Check an intake request

```bash
btp-ma check \
  --workflow requirement-analysis \
  --request requests/examples/requirement-analysis-missing-docs.yaml
```

The command returns `BLOCKED` and renders the exact information the agent must request.

### 3. Try a ready request

```bash
btp-ma check \
  --workflow coding \
  --request requests/examples/coding-ready.yaml
```

### 4. Generate an intake template

```bash
btp-ma template --workflow test-script-creation --output request.yaml
```

### 5. Run tests

```bash
pytest
ruff check .
```

## Agent workflow

1. Invoke `using-btp-ma-ai-development`.
2. Classify the requested workflow.
3. Invoke `collecting-required-inputs`.
4. Inspect material already supplied; never ask for it twice.
5. Block and ask for missing mandatory inputs.
6. Route ready work to the fixed specialist agent.
7. Produce traceable artifacts.
8. Obtain the configured human approvals.
9. Execute in an isolated branch/worktree where applicable.
10. Independently review and freshly verify before any completion claim.

See `docs/WORKFLOW.md` and `docs/ARCHITECTURE.md` for the complete design.

## Connecting real systems

The package intentionally provides connector interfaces rather than embedded credentials. Implement the interfaces in `src/btp_ma_framework/connectors/` and route secrets through your approved enterprise secret/destination service. Never store tokens in prompts, committed `.env` files, or skill documents.

## Upstream relationship

This is an independent BTP@MA extension package inspired by `obra/superpowers`. It does not vendor the upstream project. See `UPSTREAM.md` and `NOTICE.md` for attribution and integration options.

## Status

This starter package provides the policy model, intake enforcement, agent/skill definitions, templates, schemas, CI, and testable reference code. Jira, documentation-platform, GitHub write actions, SAP BTP deployment, and model-provider calls are extension points and are not enabled by default.

## Publish to the target GitHub repository

The package includes authenticated publishing scripts for:

`https://github.com/rimbunanksasdnbhd-boop/AI-driven-development-process`

On Windows PowerShell:

```powershell
.\scripts\publish-to-github.ps1
```

See [UPLOAD_TO_GITHUB.md](UPLOAD_TO_GITHUB.md) for authentication, review, and Linux/macOS instructions. The scripts never store a GitHub token in the repository.
