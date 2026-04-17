output "api_group_id" {
  description = "API Gateway Group ID"
  value       = alicloud_api_gateway_group.apiGatewayGroup.id
}

output "api_group_name" {
  description = "API Gateway Group Name"
  value       = alicloud_api_gateway_group.apiGatewayGroup.name
}

output "api_group_description" {
  description = "API Gateway Group Description"
  value       = alicloud_api_gateway_group.apiGatewayGroup.description
}