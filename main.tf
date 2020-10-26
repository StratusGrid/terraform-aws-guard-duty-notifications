resource "aws_guardduty_detector" "detector" {
  enable 		       = true
  finding_publishing_frequency = var.guardduty_subsequent_findings_publishing_frequency
}

# This can easily be done with a for_each, but it is made this way to keep the variable as a simple boolean
resource "aws_sns_topic" "guardduty_findings_info" {
  count = var.enable_sns ? 1 : 0
  name  = "guardduty-findings-info"
}

resource "aws_sns_topic" "guardduty_findings_warning" {
  count = var.enable_sns ? 1 : 0
  name  = "guardduty-findings-warning"
}

resource "aws_sns_topic" "guardduty_findings_critical" {
  count = var.enable_sns ? 1 : 0
  name  = "guardduty-findings-critical"
}

resource "aws_cloudwatch_event_rule" "info" {
  count 	= var.enable_sns ? 1 : 0
  name          = "guardduty-finding-info-events"
  event_pattern = file("${path.module}/event-pattern-info.json")
}

resource "aws_cloudwatch_event_rule" "warning" {
  count 	= var.enable_sns ? 1 : 0
  name          = "guardduty-finding-warning-events"
  event_pattern = file("${path.module}/event-pattern-warning.json")
}

resource "aws_cloudwatch_event_rule" "critical" {
  count 	= var.enable_sns ? 1 : 0
  name          = "guardduty-finding-critical-events"
  event_pattern = file("${path.module}/event-pattern-critical.json")
}

resource "aws_cloudwatch_event_target" "info" {
  count     = var.enable_sns ? 1 : 0
  rule      = aws_cloudwatch_event_rule.info.name
  target_id = "info"
  arn       = aws_sns_topic.guardduty_findings_info.arn
}

resource "aws_cloudwatch_event_target" "warning" {
  count     = var.enable_sns ? 1 : 0
  rule      = aws_cloudwatch_event_rule.warning.name
  target_id = "warning"
  arn       = aws_sns_topic.guardduty_findings_warning.arn
}

resource "aws_cloudwatch_event_target" "critical" {
  count     = var.enable_sns ? 1 : 0
  rule      = aws_cloudwatch_event_rule.critical.name
  target_id = "critical"
  arn       = aws_sns_topic.guardduty_findings_critical.arn
}
