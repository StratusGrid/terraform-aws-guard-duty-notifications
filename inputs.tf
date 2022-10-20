variable "guardduty_subsequent_findings_publishing_frequency" {
  type        = string
  description = "The frequency of notifications sent about the subsequent finding occurrences"
  default     = "SIX_HOURS"
}

variable "enable_sns" {
  type        = bool
  description = "Enable or disable SNS"
  default     = true
}

variable "project_name" {
  type        = string
  description = "Set the name of the project"
}

