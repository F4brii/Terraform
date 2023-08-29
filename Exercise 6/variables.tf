variable "virgigina_cidr" {
  description = "CIDR virginia"
  type        = string
  sensitive   = false
}

variable "private_subnet" {
  description = "Private subnetwork"
  type        = string
  sensitive   = false
}

variable "public_subnet" {
  description = "Public subnetwork"
  type        = string
  sensitive   = false
}