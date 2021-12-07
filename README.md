# Terraform project template

Template I use for Terraform projects. It includes:

- [tfsec](https://github.com/aquasecurity/tfsec)
  - Locally:
    ```shell script
    make tfsec
    ```
  - [GitHub Action](.github/workflows/tfsec_pr_commenter.yaml)
- [super-linter](https://github.com/github/super-linter)
  - Locally:
    ```shell script
    make linters
    ```
  - [GitHub Action](.github/workflows/linters.yaml)
- [GitLeaks](https://github.com/zricethezav/gitleaks)
  - Locally:
    ```shell script
    make gitleaks
    ```
  - [GitHub Action](.github/workflows/gitleaks.yaml)

## Usage

```shell script
make apply
```
