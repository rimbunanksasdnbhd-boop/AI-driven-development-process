# Upstream methodology

This framework is designed to be used with or alongside:

- Repository: `obra/superpowers`
- Upstream release reviewed for this starter: `v6.1.1` (2026-07-02)
- License: MIT

## What is reused conceptually

- design before implementation;
- explicit implementation plans;
- isolated Git workspaces;
- test-first development where appropriate;
- independent specification and code-quality review;
- fresh verification evidence before completion claims;
- skills treated as testable process code.

## What BTP@MA adds

- workflow-specific mandatory intake;
- product-document grounding;
- test-template grounding;
- codebase/repository grounding;
- Jira and requirement traceability;
- fixed enterprise agent roles;
- tool and secret governance;
- business, architecture, security, quality, and release approval gates;
- SAP BTP deployment and operational extension points.

## Recommended integration options

### Option A — Separate plugins, recommended

Install Superpowers in the coding harness and keep this repository as the BTP@MA enterprise layer. The BTP@MA bootstrap skill takes precedence for intake and governance; Superpowers skills are used for design, planning, worktrees, implementation, review, and verification.

### Option B — Git submodule

```bash
git submodule add https://github.com/obra/superpowers.git vendor/superpowers
git submodule update --init --recursive
```

Pin the submodule to an internally reviewed tag or commit. Do not automatically track `main` in production.

### Option C — Controlled internal fork

Fork Superpowers into your enterprise GitHub organization, retain its MIT license and copyright notice, and apply an internal update/review process.
