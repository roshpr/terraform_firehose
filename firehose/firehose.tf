data "template_file" "access_policy" {
  template = "${file("${path.root}/../template/access_policy.tpl")}"

  vars {
    #elasticsearch_ips_to_allow_access = "${formatlist("\"%s\"", split(",","10.10.10.10,20.20.20.20"))}"
    region = "${var.aws["region"]}"
    account_id = "${var.aws["account_id"]}"
    name = "${var.name}"
  }
}

resource "aws_kinesis_firehose_delivery_stream" "vpc_stream" {
  name        = "${var.name}-vpc-kinesis-firehose-stream"
  destination = "elasticsearch"

  s3_configuration {
    role_arn           = "${aws_iam_role.firehose_role.arn}"
    bucket_arn         = "${aws_s3_bucket.bucket.arn}"
    compression_format = "UNCOMPRESSED"
    prefix = "fire"
  }

  elasticsearch_configuration {
    domain_arn = "${var.es_arn}"
    role_arn   = "${aws_iam_role.firehose_role.arn}"
    index_name = "cwl"
    type_name  = "log"
    index_rotation_period = "OneHour"
    s3_backup_mode = "FailedDocumentsOnly"
    retry_duration = "300"
  }
}
resource "aws_s3_bucket" "bucket" {
  bucket = "${var.name}-s3-fire"
  acl    = "private"
}

resource "aws_iam_role" "firehose_role" {
  name = "firehose_vpcflow_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "firehose.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}