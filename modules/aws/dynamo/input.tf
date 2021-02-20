variable "region" {
  default = "eu-west-1"
}

variable "env" {
  default = "demo"
}

variable "write_capacity" {
  default = "10"
}

variable "read_capacity" {
  default = "10"
}

variable "tags" {
  type = map(string)
}
