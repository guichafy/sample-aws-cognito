# terraform {
#   experiments = [module_variable_optional_attrs]
# }

variable "userPoolName" {
  type    = string
  default = "lab"
}

variable "aliasAttributes" {
  type    = list(string)
  default = ["email"]
}

variable "mfaConfiguration" {
  type    = string
  default = "OFF"
}

variable "schema_attrs" {
  type = list(object({
    name                = string
    attribute_data_type = string
    mutable             = bool
    required            = bool
    string_attribute_constraints = list(object({
      min_length = number
      max_length = number
    }))

  }))
  description = "Schema attributes of a user pool"
  default = [
    {
      name                     = "email"
      attribute_data_type      = "String"
      developer_only_attribute = false
      mutable                  = true
      required                 = true
      string_attribute_constraints = [
        {
          min_length = 7
          max_length = 320
        }
      ]
    },
    {
      name                     = "name"
      attribute_data_type      = "String"
      developer_only_attribute = false
      mutable                  = true
      required                 = true
      string_attribute_constraints = [
        {
          min_length = 3
          max_length = 100
        }
      ]
    }
  ]
}
