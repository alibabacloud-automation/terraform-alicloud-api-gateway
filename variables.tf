# ApiGateway api group variables
variable "api_group_name" {
  default = "TerraformApiGatewayGroup"
}

variable "api_group_description" {
  description = "The name of a api group."
  default     = "Module of APi gateway Group"
}

# ApiGateway api variables

variable "api_name" {
  default = "TerraformApiGatewayApi"
}

variable "api_description" {
  default = "description"
}

variable "api_auth_type" {
  default = "APP"
}

variable "api_request_config" {
  type = "list"

  default = [
    {
      protocol = "HTTP"
      method   = "GET"
      path     = "/test/path1"
      mode     = "MAPPING"
    },
  ]
}

variable "api_service_type" {
  default = "HTTP"
}

variable "api_http_service_config" {
  type = "list"

  default = [
    {
      address   = "http://apigateway-backend.alicloudapi.com:8080"
      method    = "GET"
      path      = "/web/cloudapi"
      timeout   = 12
      aone_name = "cloudapi-openapi"
    },
  ]
}

variable "api_request_parameters" {
  type = "list"

  default = [
    {
      name         = "test"
      type         = "STRING"
      required     = "REQUIRED"
      in           = "QUERY"
      in_service   = "QUERY"
      name_service = "testparams"
    },
  ]
}

variable "api_stage_name" {
  type = "list"

  default = [
    "RELEASE",
    "PRE",
    "TEST",
  ]
}
