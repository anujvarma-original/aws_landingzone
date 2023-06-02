# Contributing

## Pre-Commit
https://pre-commit.com

Install from the working directory:
```sh
pre-commit install
```

### Required hooks
#### tflint
https://github.com/terraform-linters/tflint

#### tfsec
https://github.com/aquasecurity/tfsec

#### terraform-docs
https://terraform-docs.io/user-guide

#### infracost
Setup infracost integration.

***Hook uses `jq` to process the cost estimation report returned by infracost breakdown command***

https://github.com/infracost/infracost

Get your `INFRACOST_API_KEY`:

```sh
infracost auth login
export INFRACOST_API_KEY=blah
```
