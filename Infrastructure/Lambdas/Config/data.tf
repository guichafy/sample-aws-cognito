data "aws_api_gateway_rest_api" "sample_project_api" {
  name = "sample-project-api-gateway-openapi"
}

data "aws_caller_identity" "current" {}


data "aws_ssm_parameter" "userPoolWebClientId" {
  name = "/cognito/userPoolWebClientId"
}

data "aws_ssm_parameter" "userPoolId" {
  name = "/cognito/userPoolId"
}

