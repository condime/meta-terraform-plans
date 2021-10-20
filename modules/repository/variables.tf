variable "name" {}

variable "description" {
  default = ""
}

variable "private" {
  type    = bool
  default = false
}

variable "constants" {
  type = map
}
