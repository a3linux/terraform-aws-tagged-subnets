variable "vpc_id" {
  type = string
  description = "VPC ID"
  default = null
}

variable "name" {
  type = string
  description = "Name tag"
  default = null
}

variable "tags" {
  type = map
  description = "Other tags"
  default = {}
}
