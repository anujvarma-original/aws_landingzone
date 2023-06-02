data "aws_region" "current" {}
data "aws_organizations_organization" "org" {}
data "aws_organizations_organizational_units" "root" {
  parent_id = data.aws_organizations_organization.org.roots[0].id
}

resource "aws_organizations_organizational_unit" "infrastructure" {
  parent_id = data.aws_organizations_organizational_units.root.id
  name      = "Infrastructure"
}
