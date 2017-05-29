data "archive_file" "zip_lamda_ingestor" {
  type = "zip"
  source_dir = "${path.root}/../lambda/ingestor"
  output_path = "${path.root}/.terraform/archive_files/ingestor.zip"
}
resource "aws_lambda_function" "ingestor_lamda_function" {
  filename = "${data.archive_file.zip_lamda_ingestor.output_path}"
  function_name = "vpcflowlog-FlowLogIngestionFunction"
  handler = "autoscaling_handler_route53_lamda.lambda_autoscale_handler"
  role = "${aws_iam_role.lambda_iam_role.arn}"
  runtime = "python2.7"
  description = "${var.name} lambda function ingestor"
  publish = true
  environment {
    variables = {
      DELIVERY_STREAM_NAME = "${var.name}-vpc-kinesis-firehose-stream"
    }
  }
}

data "archive_file" "zip_lamda_decorator" {
  type = "zip"
  source_dir = "${path.root}/../lambda/decorator"
  output_path = "${path.root}/.terraform/archive_files/decorator.zip"
}
resource "aws_lambda_function" "decorator_lamda_function" {
  filename = "${data.archive_file.zip_lamda_decorator.output_path}"
  function_name = "vpcflowlog-FlowLogDecoratorFunction"
  handler = "autoscaling_handler_route53_lamda.lambda_autoscale_handler"
  role = "${aws_iam_role.lambda_iam_role.arn}"
  runtime = "python2.7"
  description = "${var.name} lambda function decorator"
  publish = true
  environment {
    variables = {
      DELIVERY_STREAM_NAME = "${var.name}-vpc-kinesis-firehose-stream"
    }
  }
}
resource "aws_iam_role" "lambda_iam_role" {
  name               = "${var.name}-vpclogs-lambda-iam-role"
  assume_role_policy = "${file("${path.root}/../template/lambda_access_policy.tpl")}"
}