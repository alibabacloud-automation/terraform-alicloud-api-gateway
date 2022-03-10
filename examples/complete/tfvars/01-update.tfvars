# ApiGateway api group variables
api_group_name        = "update_tf_testacc_group"
api_group_description = "update-tf-testacc-group-description"

# ApiGateway api variables
api_name        = "update_tf_testacc_api"
api_description = "update-tf-testacc-api-description"
api_auth_type   = "ANONYMOUS"
api_request_config = [
  {
    protocol = "HTTP"
    method   = "GET"
    path     = "/test/path"
    mode     = "MAPPING"
  },
]
api_http_service_config = [
  {
    address   = "http://apigateway-backend.alicloudapi.com:8080"
    method    = "GET"
    path      = "/web/cloudapi/update"
    timeout   = 20
    aone_name = "cloudapi-openapi"
  },
]
api_request_parameters = [
  {
    name         = "testparam"
    type         = "STRING"
    required     = "OPTIONAL"
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