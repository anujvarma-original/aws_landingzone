# AWS Landing Zone
Project deploys Control Tower Controls against OUs in the AWS Organization.

## Prerequisites
### 1. Setup AWS Management account
AWS Control Tower Requires a standalone AWS account in order to configure AWS Organizations/ Control Tower.

### 2. Enable AWS Control Tower Landing Zone

* Launch your AWS Control Tower landing zone in `us-east-1`:

<img src="images/control-tower-setup.png" width="500px">

* Set home region:

<img src="images/step-1.png" width="500px">

* Enabled deny region setting:

<img src="images/step-2.png" width="500px">

* Select regions to enable:

<img src="images/step-3-1.png" width="500px">

<img src="images/step-3-2.png" width="500px">

* Configure OUs:

<img src="images/step-4.png" width="500px">

* Setup additional required accounts:

<img src="images/step-5-1.png" width="500px">

<img src="images/step-5-2.png" width="500px">

* Enable CloudTrail:

<img src="images/step-6.png" width="500px">

* Success:

<img src="images/step-7.png" width="500px">


### 3. Create S3 Bucket for Terraform Backend

Manually create a secure AWS S3 bucket via AWS CLI as the first Terraform backend:

```sh
aws s3api create-bucket --bucket anuj-tfbackend --object-lock-enabled-for-bucket
```

***Since April 2023, S3 Public Access Block is enabled by default.***

### 4. Deploy Control Tower Controls

Complete vars file at `./tfvars/prod.tfvars`:
```
profile = "123_abc"
management_account = "123"
```

Complete the backend config at `./backends/finops.backend.tfvars`:
```
profile = "123_abc"
```

Deploy:
```sh
terraform init -backend-config=./backends/finops.backend.tfvars
terraform apply -var-file=./tfvars/prod.tfvars
```

## Terraform Docs

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.4.6 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.67.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.0.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_controltower_control.ec2_vol_inuse](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/controltower_control) | resource |
| [aws_organizations_organizational_unit.infrastructure](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/organizations_organizational_unit) | resource |
| [aws_organizations_organization.org](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/organizations_organization) | data source |
| [aws_organizations_organizational_units.root](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/organizations_organizational_units) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_management_account"></a> [management\_account](#input\_management\_account) | n/a | `string` | n/a | yes |
| <a name="input_profile"></a> [profile](#input\_profile) | n/a | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | `"us-east-1"` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
