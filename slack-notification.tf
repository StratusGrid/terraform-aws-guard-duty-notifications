### SNS Subscription to Slack
module "slack_guardduty_findings_critical" {
  count             = var.enable_sns ? 1 : 0
  source  = "terraform-aws-modules/notify-slack/aws"

  sns_topic_name = aws_sns_topic.guardduty_findings_critical[0].name

  slack_webhook_url = "https://hooks.slack.com/services/AAA/BBB/CCC"
  slack_channel     = "aws-notification"
  slack_username    = "aws-guardduty-reporter"
}
