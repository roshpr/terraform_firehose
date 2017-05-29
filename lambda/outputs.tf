output "lambda_decorator" {
  value = "${aws_lambda_function.decorator_lamda_function.function_name}"
}
output "lambda_injestor" {
  value = "${aws_lambda_function.ingestor_lamda_function.function_name}"
}