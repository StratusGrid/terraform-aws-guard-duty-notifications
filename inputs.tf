variable "enable_sns" {
  type        = bool
  description = "Enable or disable GuardDuty findings notifications."
  default     = true
}

variable "project_name" {
  type        = string
  description = "Set the name of the project"
}

