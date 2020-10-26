variable "guardduty_subsequent_findings_publishing_frequency" {
  type        = string
  description = "The frequency of notifications sent about the subsequent finding occurrences"
  default     = "SIX_HOURS"
}

variable "enable_sns" {
  type        = bool
  description = ""
  default     = true
}
