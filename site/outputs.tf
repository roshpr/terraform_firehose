output "firehose_name" {
  value = "${module.firehose.firehose_name}"
}
output "lambda_decorator_function" {
  value = "${module.lambda.lambda_decorator}"
}
output "lambda_ingestor_function" {
  value = "${module.lambda.lambda_injestor}"
}
output "elasticsearch_domain_name" {
  value = "${module.elasticsearch.es_name}"
}