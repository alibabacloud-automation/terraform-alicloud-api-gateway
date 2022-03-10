output "api_id" {
  value = alicloud_api_gateway_api.apiGatewayApi.id
}

output "api_name" {
  value = alicloud_api_gateway_api.apiGatewayApi.name
}

output "api_description" {
  value = alicloud_api_gateway_api.apiGatewayApi.description
}

output "api_auth_type" {
  value = alicloud_api_gateway_api.apiGatewayApi.auth_type
}

output "api_request_config" {
  value = alicloud_api_gateway_api.apiGatewayApi.request_config
}

output "api_service_type" {
  value = alicloud_api_gateway_api.apiGatewayApi.service_type
}

output "api_http_service_config" {
  value = alicloud_api_gateway_api.apiGatewayApi.http_service_config
}

output "api_request_parameters" {
  value = alicloud_api_gateway_api.apiGatewayApi.request_parameters
}

output "api_stage_name" {
  value = alicloud_api_gateway_api.apiGatewayApi.stage_names
}