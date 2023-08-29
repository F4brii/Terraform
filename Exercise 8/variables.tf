variable "virgigina_cidr" {
  description = "CIDR virginia"
  type        = string
  sensitive   = false
}

variable "subnets_list" {
  description = "Subnet list"
  type        = list(string)
}

variable "tags" {
  description = "Tags"
  type        = map(string)
}
