# Verification record

Verified on 2026-07-21 against the starter package in this repository.

## Commands

```bash
python -m pip install -e ".[dev]"
btp-ma validate-policy
pytest -q
ruff check .
python -m compileall -q src
```

## Results

- Intake policy: 4 workflows validated.
- Automated tests: 8 passed.
- Ruff: all checks passed.
- Python compilation: passed.
- All YAML/YML files: parsed successfully.
- Blocked intake example: returned exit code 2 and requested missing product documentation and requirement examples.
- Ready coding example: routed to `development-agent` and `implementing-approved-changes`.

This verifies the starter framework and intake-control implementation. It does not verify external Jira, documentation, GitHub Enterprise, SAP BTP, CI/CD, or model-provider integrations because those connectors are intentionally interfaces only.
## HTML presentation guide

- `README.html` and `index.html` are self-contained and use no external assets.
- HTML structure validated with BeautifulSoup.
- Verified content includes three intake gates, four specialist agents, nine repository sections, and five copyable command blocks.
- Responsive and print-specific CSS are included.

