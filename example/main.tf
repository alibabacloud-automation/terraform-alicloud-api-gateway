module "api_group" {
  source = "../modules/api_group"

  api_group_name = "TerraformApiGatewayGroup"

  api_group_description = "Module of APi gateway Group"
}

module "api" {
  source = "../modules/api"

  group = "${module.api_group.api_group_id}"

  api_name = "TerraformApiGatewayApi"

  api_description = "description"

  api_auth_type = "APP"

  api_request_config = [
    {
      protocol = "HTTP"
      method   = "GET"
      path     = "/test/path1"
      mode     = "MAPPING"
    },
  ]

  api_service_type = "HTTP"

  api_http_service_config = [
    {
      address   = "http://apigateway-backend.alicloudapi.com:8080"
      method    = "GET"
      path      = "/web/cloudapi"
      timeout   = 12
      aone_name = "cloudapi-openapi"
    },
  ]

  api_request_parameters = [
    {
      name         = "test"
      type         = "STRING"
      required     = "REQUIRED"
      in           = "QUERY"
      in_service   = "QUERY"
      name_service = "testparams"
    },
  ]

  api_stage_name = [
    "RELEASE",
    "PRE",
    "TEST",
  ]
}
