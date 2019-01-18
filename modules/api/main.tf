resource "alicloud_api_gateway_api" "apiGatewayApi" {
  name        = "${var.api_name}"
  group_id    = "${var.group}"
  description = "${var.api_description}"
  auth_type   = "${var.api_auth_type}"

  request_config = "${var.api_request_config}"

  service_type = "${var.api_service_type}"

  http_service_config = "${var.api_http_service_config}"

  request_parameters = "${var.api_request_parameters}"

  stage_names = "${var.api_stage_name}"
}
