variable "constants" {
  type = map
}

variable "name" {}

variable "description" {
  default = ""
}

variable "private" {
  type    = bool
  default = false
}
