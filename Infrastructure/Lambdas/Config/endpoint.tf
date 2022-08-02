

resource "aws_api_gateway_resource" "resource_api_gateway" {
  rest_api_id = data.aws_api_gateway_rest_api.sample_project_api.id
  parent_id   = data.aws_api_gateway_rest_api.sample_project_api.root_resource_id
  path_part   = "config"
}

resource "aws_api_gateway_method" "resource_api_gateway_method" {
  rest_api_id   = data.aws_api_gateway_rest_api.sample_project_api.id
  resource_id   = aws_api_gateway_resource.resource_api_gateway.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "config_integration" {
  rest_api_id             = data.aws_api_gateway_rest_api.sample_project_api.id
  resource_id             = aws_api_gateway_resource.resource_api_gateway.id
  http_method             = aws_api_gateway_method.resource_api_gateway_method.http_method
  integration_http_method = "POST"
  type                    = "AWS"
  uri                     = "arn:aws:apigateway:${var.aws_region}:lambda:path/2015-03-31/functions/arn:aws:lambda:${var.aws_region}:${data.aws_caller_identity.current.account_id}:function:${aws_lambda_function.config.function_name}/invocations"
  
  credentials             = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/${aws_iam_role.lambda_apigateway_iam_role.name}"
}



resource "aws_api_gateway_method_response" "success" {
  rest_api_id = data.aws_api_gateway_rest_api.sample_project_api.id
  resource_id = aws_api_gateway_resource.resource_api_gateway.id
  http_method = "GET"

  status_code = "200"
}

resource "aws_api_gateway_integration_response" "config_integration_response" {
  depends_on  = ["aws_api_gateway_integration.config_integration"]
  rest_api_id = data.aws_api_gateway_rest_api.sample_project_api.id
  resource_id = aws_api_gateway_resource.resource_api_gateway.id
  http_method = "GET"
  status_code = aws_api_gateway_method_response.success.status_code
}