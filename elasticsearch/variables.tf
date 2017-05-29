variable "name" { default = "eccentral" }
variable "aws" {
  type = "map"
  default = {
    profile = ""
    region = ""
    account_id = ""
  }
}
variable "es_config" {
type = "map"
  default = {
    instance_type = ""
    engine_version = ""
    instance_count = ""
    volume_size = 50
    zone_awareness_enabled = false
    elasticsearch_ips_to_allow_access = ""
  }
}