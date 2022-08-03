resource "aws_cognito_user_pool" "lab_userPool" {
  name              = var.userPoolName
  alias_attributes  = var.aliasAttributes
  mfa_configuration = var.mfaConfiguration
  dynamic "schema" {
    for_each = var.schema_attrs
    content {
      name                     = schema.value["name"]
      attribute_data_type      = schema.value["attribute_data_type"]
      developer_only_attribute = false # schema.value["developer_only_attribute"]
      mutable                  = schema.value["mutable"]
      required                 = schema.value["required"]
      dynamic "string_attribute_constraints" {
        for_each = lookup(schema.value, "string_attribute_constraints", [])
        content {
          min_length = string_attribute_constraints.value["min_length"]
          max_length = string_attribute_constraints.value["max_length"]
        }
      }
    }
  }

  auto_verified_attributes = ["email"]
  account_recovery_setting {
    recovery_mechanism {
      name     = "verified_email"
      priority = 1
    }
  }
}

resource "aws_cognito_user_pool_client" "client_cognito" {
  name = "client-web"

  user_pool_id = aws_cognito_user_pool.lab_userPool.id

  generate_secret     = false
  explicit_auth_flows = ["ALLOW_CUSTOM_AUTH", "ALLOW_USER_SRP_AUTH", "ALLOW_REFRESH_TOKEN_AUTH"]
}


# 

resource "aws_ssm_parameter" "cognitoUserPoolWebClientId" {
  name  = "/cognito/userPoolWebClientId"
  type  = "String"
  value = aws_cognito_user_pool_client.client_cognito.id
}

resource "aws_ssm_parameter" "cognitoUserPoolId" {
  name  = "/cognito/userPoolId"
  type  = "String"
  value = aws_cognito_user_pool.lab_userPool.id
}


resource "aws_ssm_parameter" "cognitoRegion" {
  name  = "/cognito/region"
  type  = "String"
  value = "sa-east-1"
}
