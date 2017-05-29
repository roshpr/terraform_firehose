output "firehose_name" {
  value = "${aws_kinesis_firehose_delivery_stream.vpc_stream.name}"
}