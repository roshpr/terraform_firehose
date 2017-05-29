output "es_arn" {
  value = "${aws_elasticsearch_domain.es.arn}"
}
output "es_name" {
  value = "${aws_elasticsearch_domain.es.domain_name}"
}