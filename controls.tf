#########################################
# Control Tower Controls
#########################################
# AWS-GR_EC2_VOLUME_INUSE_CHECK
resource "aws_controltower_control" "ec2_vol_inuse" {
  control_identifier = "arn:aws:controltower:${data.aws_region.current.name}::control/AWS-GR_EC2_VOLUME_INUSE_CHECK"
  target_identifier  = aws_organizations_organizational_unit.infrastructure.id
}
