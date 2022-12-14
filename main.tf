# This can easily be done with a for_each, but it is made this way to keep the variable as a simple boolean
resource "aws_sns_topic" "guardduty_findings_info" {
  count             = var.enable_sns ? 1 : 0
kms_master_key_id = aws_kms_key.this.key_id
  name              = "guardduty-findings-info"
}

resource "aws_sns_topic" "guardduty_findings_warning" {
  count             = var.enable_sns ? 1 : 0
  kms_master_key_id = aws_kms_key.this.key_id
  name              = "guardduty-findings-warning"
}

resource "aws_sns_topic" "guardduty_findings_critical" {
  count             = var.enable_sns ? 1 : 0
  kms_master_key_id = aws_kms_key.this.key_id
  name              = "guardduty-findings-critical"
}

resource "aws_cloudwatch_event_rule" "info" {
  count         = var.enable_sns ? 1 : 0
  name          = "guardduty-finding-info-events"
  event_pattern = file("${path.module}/event-pattern-info.json")
}

resource "aws_cloudwatch_event_rule" "warning" {
  count         = var.enable_sns ? 1 : 0
  name          = "guardduty-finding-warning-events"
  event_pattern = file("${path.module}/event-pattern-warning.json")
}

resource "aws_cloudwatch_event_rule" "critical" {
  count         = var.enable_sns ? 1 : 0
  name          = "guardduty-finding-critical-events"
  event_pattern = file("${path.module}/event-pattern-critical.json")
}

resource "aws_cloudwatch_event_target" "info" {
  count     = var.enable_sns ? 1 : 0
  rule      = aws_cloudwatch_event_rule.info[0].name
  target_id = "info"
  arn       = aws_sns_topic.guardduty_findings_info[0].arn
}

resource "aws_cloudwatch_event_target" "warning" {
  count     = var.enable_sns ? 1 : 0
  rule      = aws_cloudwatch_event_rule.warning[0].name
  target_id = "warning"
  arn       = aws_sns_topic.guardduty_findings_warning[0].arn
}

resource "aws_cloudwatch_event_target" "critical" {
  count     = var.enable_sns ? 1 : 0
  rule      = aws_cloudwatch_event_rule.critical[0].name
  target_id = "critical"
  arn       = aws_sns_topic.guardduty_findings_critical[0].arn
}

locals {
  kms_allowed_accounts = compact([data.aws_caller_identity.current.account_id])
}

resource "aws_kms_key" "this" {
  description         = "Key used to encrypt the topics"
  policy              = data.aws_iam_policy_document.this.json
  enable_key_rotation = true
}

resource "aws_kms_alias" "this" {
  name          = "alias/${var.project_name}-SNS-topics"
  target_key_id = aws_kms_key.this.key_id
}