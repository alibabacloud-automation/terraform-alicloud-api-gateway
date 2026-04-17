output "this_api_id" {
  description = "The id of the apiGatewayApi"
  value       = module.api_gateway.this_api_id
}

output "this_api_group_id" {
  description = "API Gateway Group ID"
  value       = module.api_gateway.this_api_group_id
}