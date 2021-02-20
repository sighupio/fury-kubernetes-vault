variable "region" {
  default = "eu-west-1"
}

variable "name" {
  type string
}

variable "env" {
  default = "demo"
}

variable "tags" {
  type = map(string)
}

