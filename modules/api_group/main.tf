resource "alicloud_api_gateway_group" "apiGatewayGroup" {
  name        = "${var.api_group_name}"
  description = "${var.api_group_description}"
}
