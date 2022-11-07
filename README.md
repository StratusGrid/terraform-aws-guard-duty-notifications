<!-- BEGIN_TF_DOCS -->
# terraform-aws-lambda-pipeline
GitHub: [StratusGrid/terraform-aws-lambda-pipeline](https://github.com/StratusGrid/terraform-aws-lambda-pipeline)
## Example
```hcl

```
## StratusGrid Standards we assume
- All resource names and name tags shall use `_` and not `-`s
- The old naming standard for common files such as inputs, outputs, providers, etc was to prefix them with a `-`, this is no longer true as it's not POSIX compliant. Our pre-commit hooks will fail with this old standard.
- StratusGrid generally follows the TerraForm standards outlined [here](https://www.terraform-best-practices.com/naming)
## Repo Knowledge
Repository for Module for AWS Lambda CICD
## Documentation
This repo is self documenting via Terraform Docs, please see the note at the bottom.
### `LICENSE`
This is the standard Apache 2.0 License as defined [here](https://stratusgrid.atlassian.net/wiki/spaces/TK/pages/2121728017/StratusGrid+Terraform+Module+Requirements).
### `outputs.tf`
The StratusGrid standard for Terraform Outputs.
### `README.md`
It's this file! I'm always updated via TF Docs!
### `tags.tf`
The StratusGrid standard for provider/module level tagging. This file contains logic to always merge the repo URL.
### `variables.tf`
All variables related to this repo for all facets.
One day this should be broken up into each file, maybe maybe not.
### `versions.tf`
This file contains the required providers and their versions. Providers need to be specified otherwise provider overrides can not be done.
## Documentation of Misc Config Files
This section is supposed to outline what the misc configuration files do and what is there purpose
### `.config/.terraform-docs.yml`
This file auto generates your `README.md` file.
### `.github/workflows/pre-commit.yml`
This file contains the instructions for Github workflows, in specific this file run pre-commit and will allow the PR to pass or fail. This is a safety check and extras for if pre-commit isn't run locally.
### `examples/*`
The files in here are used by `.config/terraform-docs.yml` for generating the `README.md`. All files must end in `.tfnot` so Terraform validate doesn't trip on them since they're purely example files.
### `.gitignore`
This is your gitignore, and contains a slew of default standards.
---
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.9 |
## Resources

| Name | Type |
|------|------|
| [aws_cloudwatch_event_rule.critical](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_rule.info](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_rule.warning](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_rule) | resource |
| [aws_cloudwatch_event_target.critical](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_cloudwatch_event_target.info](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_cloudwatch_event_target.warning](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudwatch_event_target) | resource |
| [aws_guardduty_detector.detector](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/guardduty_detector) | resource |
| [aws_kms_alias.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_alias) | resource |
| [aws_kms_key.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/kms_key) | resource |
| [aws_sns_topic.guardduty_findings_critical](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic.guardduty_findings_info](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
| [aws_sns_topic.guardduty_findings_warning](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/sns_topic) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_enable_sns"></a> [enable\_sns](#input\_enable\_sns) | Enable or disable SNS | `bool` | `true` | no |
| <a name="input_guardduty_subsequent_findings_publishing_frequency"></a> [guardduty\_subsequent\_findings\_publishing\_frequency](#input\_guardduty\_subsequent\_findings\_publishing\_frequency) | The frequency of notifications sent about the subsequent finding occurrences | `string` | `"SIX_HOURS"` | no |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Set the name of the project | `string` | n/a | yes |
## Outputs

No outputs.
---
Note, manual changes to the README will be overwritten when the documentation is updated. To update the documentation, run `terraform-docs -c .config/.terraform-docs.yml`
<!-- END_TF_DOCS -->