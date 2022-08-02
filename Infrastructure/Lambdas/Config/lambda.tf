
resource "aws_lambda_function" "config" {
  function_name = "sampleproject-config"
  filename      = local.jar_path
  role             = "${aws_iam_role.lambda_apigateway_iam_role.arn}"
  handler          = "org.springframework.cloud.function.adapter.aws.FunctionInvoker::handleRequest"
  source_code_hash = filebase64sha256(local.jar_path)
  runtime          = "java11"
  memory_size      = "256" 
  timeout = 30

  environment {
    variables = {
      FUNCTION_NAME = "getConfig"
      USER_POOL_WEB_CLIENT_ID = data.aws_ssm_parameter.userPoolWebClientId.value
      USER_POOL_ID = data.aws_ssm_parameter.userPoolId.value
    }
  }
}

