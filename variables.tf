variable "input_tags" {
  description = "Map of tags to apply to resources"
  type        = map(string)
  default     = {}
}

variable "enable_sns" {
  type        = bool
  description = "Enable or disable GuardDuty findings notifications."
  default     = true
}
