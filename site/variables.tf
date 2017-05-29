variable "name" { default = "eccentralvpcflow" }
variable "aws" {
  type = "map"
  default = {
    profile = "useast1"
    region = "us-east-1"
    account_id = "408183818623"
  }
}

variable "es_config" {
type = "map"
  default = {
    instance_type = "m4.xlarge.elasticsearch"
    engine_version = "5.1"
    instance_count = "1"
    volume_size = 50
    zone_awareness_enabled = false
    elasticsearch_ips_to_allow_access = "116.197.184.0/27,116.197.184.64/27,66.129.239.0/27,66.129.239.64/27"
  }
}