provider "aws" {
  region = "${var.aws["region"]}"
  profile = "${var.aws["profile"]}"
}
terraform {
    required_version = ">= 0.8.2"
}
module "lambda" {
  source = "../lambda"
  name = "${var.name}"
  aws = "${var.aws}"
}
module "elasticsearch" {
  source = "../elasticsearch"
  name = "${var.name}"
  aws = "${var.aws}"
  es_config = "${var.es_config}"
}
module "firehose" {
  source = "../firehose"
  name = "${var.name}"
  aws = "${var.aws}"
  es_arn = "${module.elasticsearch.es_arn}"
}