output "api_id" {
  description = "The id of the apiGatewayApi"
  value       = alicloud_api_gateway_api.apiGatewayApi.id
}

output "api_name" {
  description = "The name of the apiGatewayApi"
  value       = alicloud_api_gateway_api.apiGatewayApi.name
}

output "api_description" {
  description = "The description of the apiGatewayApi"
  value       = alicloud_api_gateway_api.apiGatewayApi.description
}

output "api_auth_type" {
  description = "The auth type of the apiGatewayApi"
  value       = alicloud_api_gateway_api.apiGatewayApi.auth_type
}

output "api_request_config" {
  description = "The request config of the apiGatewayApi"
  value       = alicloud_api_gateway_api.apiGatewayApi.request_config
}

output "api_service_type" {
  description = "The service type of the apiGatewayApi"
  value       = alicloud_api_gateway_api.apiGatewayApi.service_type
}

output "api_http_service_config" {
  description = "The http service config of the apiGatewayApi"
  value       = alicloud_api_gateway_api.apiGatewayApi.http_service_config
}

output "api_request_parameters" {
  description = "The request parameters of the apiGatewayApi"
  value       = alicloud_api_gateway_api.apiGatewayApi.request_parameters
}

output "api_stage_name" {
  description = "The stage name of the apiGatewayApi"
  value       = alicloud_api_gateway_api.apiGatewayApi.stage_names
}