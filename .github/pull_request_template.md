## Summary

- [ ] Describe what changed and why.

## Validation Checklist

- [ ] Lint passed (`make lint`)
- [ ] Security checks passed (`make security`)
- [ ] Unit tests passed (`make test-unit`)
- [ ] Integration tests passed (`make test-integration`)
- [ ] Coverage is >= 90% (`make test-coverage`)
- [ ] Terraform validate passed (`make terraform-validate`)
- [ ] Terraform plan reviewed for expected changes (PR workflow)

## Security Checklist

- [ ] No credentials/secrets added to code or Terraform variables.
- [ ] IAM changes follow least privilege.
- [ ] S3/KMS/networking changes preserve secure defaults.
- [ ] CloudWatch and auditability remain intact.
