#################
# Api Gateway Api Group
#################
provider "alicloud" {
  version              = ">=1.56.0"
  region               = var.region != "" ? var.region : null
  configuration_source = "terraform-alicloud-modules/api-gateway"
}

module "api_group" {
  source = "./modules/api_group"

  api_group_name = var.api_group_name

  api_group_description = var.api_group_description
}

######
# Api Gateway API
######
module "api" {
  source = "./modules/api"

  api_name = var.api_name
  group    = module.api_group.api_group_id

  api_description = var.api_description
  api_auth_type   = var.api_auth_type

  api_request_config = var.api_request_config

  api_service_type = var.api_service_type

  dynamic "api_http_service_config" {
    for_each = var.api_http_service_config

    content {

      address   = api_http_service_config.value.address
      method    = api_http_service_config.value.method
      path      = api_http_service_config.value.path
      timeout   = api_http_service_config.value.timeout
      aone_name = api_http_service_config.value.aone_name
    }
  }

  dynamic "api_request_parameters" {
    for_each = var.api_request_parameters

    content {

      name         = api_request_parameters.value.name
      type         = api_request_parameters.value.type
      required     = api_request_parameters.value.required
      in           = api_request_parameters.value.in
      in_service   = api_request_parameters.value.in_service
      name_service = api_request_parameters.value.name_service
    }
  }

  api_stage_name = var.api_stage_name
}

