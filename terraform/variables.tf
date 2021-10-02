variable "vm_counts" {
  description = "List of vm integers to append to vm's name"
  type        = list(string)
  default     = ["1", "2"]
}

variable "do_token" {
  description = "DO API token"
  type        = string
}