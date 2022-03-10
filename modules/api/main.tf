resource "alicloud_api_gateway_api" "apiGatewayApi" {
  name        = var.api_name
  group_id    = var.group
  description = var.api_description
  auth_type   = var.api_auth_type

  dynamic "request_config" {
    for_each = var.api_request_config
    content {
      # TF-UPGRADE-TODO: The automatic upgrade tool can't predict
      # which keys might be set in maps assigned here, so it has
      # produced a comprehensive set here. Consider simplifying
      # this after confirming which keys can be set in practice.

      body_format = lookup(request_config.value, "body_format", null)
      method      = request_config.value.method
      mode        = request_config.value.mode
      path        = request_config.value.path
      protocol    = request_config.value.protocol
    }
  }

  service_type = var.api_service_type

  dynamic "http_service_config" {
    for_each = var.api_http_service_config
    content {
      # TF-UPGRADE-TODO: The automatic upgrade tool can't predict
      # which keys might be set in maps assigned here, so it has
      # produced a comprehensive set here. Consider simplifying
      # this after confirming which keys can be set in practice.

      address   = http_service_config.value.address
      aone_name = lookup(http_service_config.value, "aone_name", null)
      method    = http_service_config.value.method
      path      = http_service_config.value.path
      timeout   = http_service_config.value.timeout
    }
  }

  dynamic "request_parameters" {
    for_each = var.api_request_parameters
    content {
      # TF-UPGRADE-TODO: The automatic upgrade tool can't predict
      # which keys might be set in maps assigned here, so it has
      # produced a comprehensive set here. Consider simplifying
      # this after confirming which keys can be set in practice.

      default_value = lookup(request_parameters.value, "default_value", null)
      description   = lookup(request_parameters.value, "description", null)
      in            = request_parameters.value.in
      in_service    = request_parameters.value.in_service
      name          = request_parameters.value.name
      name_service  = request_parameters.value.name_service
      required      = request_parameters.value.required
      type          = request_parameters.value.type
    }
  }

  stage_names = var.api_stage_name
}