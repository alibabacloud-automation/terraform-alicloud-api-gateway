output "this_api_id" {
  description = "The id of the apiGatewayApi"
  value       = module.api.api_id
}

output "this_api_group_id" {
  description = "API Gateway Group ID"
  value       = module.api_group.api_group_id
}

output "this_api_group_name" {
  description = "API Gateway Group Name"
  value       = module.api_group.api_group_name
}

output "this_api_group_description" {
  description = "API Gateway Group Description"
  value       = module.api_group.api_group_description
}

# ApiGateway api outputs
output "this_api_name" {
  description = "The name of the apiGatewayApi"
  value       = module.api.api_name
}

output "this_api_description" {
  description = "The description of the apiGatewayApi"
  value       = module.api.api_description
}

output "this_api_auth_type" {
  description = "The auth type of the apiGatewayApi"
  value       = module.api.api_auth_type
}

output "this_api_request_config" {
  description = "The request config of the apiGatewayApi"
  value       = module.api.api_request_config
}

output "this_api_service_type" {
  description = "The service type of the apiGatewayApi"
  value       = module.api.api_service_type
}

output "this_api_http_service_config" {
  description = "The http service config of the apiGatewayApi"
  value       = module.api.api_http_service_config
}

output "this_api_request_parameters" {
  description = "The request parameters of the apiGatewayApi"
  value       = module.api.api_request_parameters
}

output "this_api_stage_name" {
  description = "The stage name of the apiGatewayApi"
  value       = module.api.api_stage_name
}