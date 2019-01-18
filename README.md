Alicloud ApiGateway Terraform Module
terraform-alicloud-api-gateway
=========================================

This Terraform module will first creates a Apigateway Api Group , then create an Apigateway Api basing on this group.

These types of resources are supported:

* [alicloud_api_gateway_group](https://www.terraform.io/docs/providers/alicloud/r/api_gateway_group.html)
* [alicloud_api_gateway_api](https://www.terraform.io/docs/providers/alicloud/r/api_gateway_api.html)

Usage
-----
You can use this in your terraform template with the following steps.

1. Adding a module resource to your template, e.g. main.tf

        module "apigateway" {
           source = "terraform-alicloud-modules/api-gateway/alicloud"

           # ApiGateway api group variables
           api_group_name = "TerraformApiGatewayGroup"

           api_group_description = "Module of APi gateway Group"

           # ApiGateway api variables
           api_name = "TerraformApiGatewayApi"

           api_description = "description"

           api_auth_type = "APP"

           api_request_config = [
               {
                 protocol = "HTTP"
                 method   = "GET"
                 path     = "/test/path1"
                 mode     = "MAPPING"
               }
             ]

           api_service_type = "HTTP"

           api_http_service_config = [
               {
                 address   = "http://apigateway-backend.alicloudapi.com:8080"
                 method    = "GET"
                 path      = "/web/cloudapi"
                 timeout   = 12
                 aone_name = "cloudapi-openapi"
               }
             ]

           api_request_parameters = [
               {
                 name         = "test"
                 type         = "STRING"
                 required     = "REQUIRED"
                 in           = "QUERY"
                 in_service   = "QUERY"
                 name_service = "testparams"
               }
             ]

           api_stage_name = [
             "RELEASE",
             "PRE",
             "TEST"
            ]

2. Setting values for the following variables:

    through environment variables

    - ALICLOUD_ACCESS_KEY
    - ALICLOUD_SECRET_KEY
    - ALICLOUD_REGION

    ## Inputs

    | Name | Description | Type | Default | Required |
    |------|-------------|:----:|:-----:|:-----:|
    |api_name          |  The name of the api gateway api.   |   string  |    ""   |    yes       |
    |api_description          |  The description of the api.    |   string  |    ""   |    no       |
    |api_auth_type          |  The authorization Type including APP and ANONYMOUS.  |   string  |   "" |    yes       |
    |api_request_config    |  Request_config defines how users can send requests to your API.   |   list  |   ""  |    yes       |
    |api_service_type               |  The type of backend service. Type including HTTP,VPC and MOCK.   |   list  |    ""   |    yes       |
    |api_http_service_config               |  http_service_config defines the config    |   list  |    ""   |    yes       |
    |api_request_parameters               |  Request_parameters defines .   |   list  |    ""   |    no       |
    |api_stage_names               |  Stages that the api need to be deployed. Valid value: RELEASE，PRE and TEST.   |   list  |    ""   |    no       |
    |api_group_name          |  The name of the api gateway group.   |   string  |    ""   |    yes       |
    |api_group_description          |  The description of the api group.    |   string  |    ""   |    no       |

    ## Outputs

    | Name | Description |
    |------|-------------|
    | this_api_id    |     the ID of api-gateway API        |
    | this_api_group_id    |     the ID of api-gateway API  Group      |

Authors
-------
Created and maintained by Lenny Bai(@[geeklenny](https://github.com/geeklenny) lennybai@live.cn)

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)
