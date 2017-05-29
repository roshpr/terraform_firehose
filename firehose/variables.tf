variable "name" { default = "eccentral" }
variable "aws" {
  type = "map"
  default = {
    profile = ""
    region = ""
    account_id = ""
  }
}
variable "es_arn" {
  default = ""
}