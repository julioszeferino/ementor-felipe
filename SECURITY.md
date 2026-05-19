# Security Policy

## Supported Versions

This repository is a learning project and tracks only the main branch in production mode.

| Version | Supported |
| --- | --- |
| main | :white_check_mark: |

## Reporting a Vulnerability

1. Do not open a public issue with exploit details.
2. Send details privately to the repository maintainers.
3. Include impact, reproduction steps, and suggested mitigation.

## Mandatory Security Gates

The CI requires:
- `bandit` for static security analysis on Python code.
- `pip-audit` for dependency vulnerability checks.
- Terraform validation (`fmt` + `validate`) and plan checks in pull requests.
- Test coverage gate of at least 90%.

## Repository Hardening Recommendations

Enable these GitHub repository settings:
- Require pull request before merging into `main`.
- Require status checks to pass before merging.
- Require branch to be up to date before merging.
- Require at least 1 approving review.
- Dismiss stale approvals when new commits are pushed.
- Restrict force pushes and branch deletions.
- Enable secret scanning and push protection.
- Enable dependency graph and Dependabot alerts.
- Enable private vulnerability reporting.
