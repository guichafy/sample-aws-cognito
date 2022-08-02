#
# Stage and Stage Settings
#

resource "aws_api_gateway_stage" "sample_project" {
  deployment_id = aws_api_gateway_deployment.sample_project.id
  rest_api_id   = aws_api_gateway_rest_api.sample_project.id
  stage_name    = "dev"
}

resource "aws_api_gateway_method_settings" "sample_project" {
  rest_api_id = aws_api_gateway_rest_api.sample_project.id
  stage_name  = aws_api_gateway_stage.sample_project.stage_name
  method_path = "*/*"

  settings {
    metrics_enabled = true
  }
}