# alicloud_api_gateway_api

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
|name          |  The name of the api gateway api.   |   string  |    ""   |    yes       |
|group_id          |  The api gateway that the api belongs to.   |   string  |    ""   |    yes       |
|description          |  The description of the api.    |   string  |    ""   |    no       |
|auth_type          |  The authorization Type including APP and ANONYMOUS.  |   string  |   "" |    yes       |
|request_config    |  Request_config defines how users can send requests to your API.   |   list  |   ""  |    yes       |
|service_type               |  The type of backend service. Type including HTTP,VPC and MOCK.   |   list  |    ""   |    yes       |
|http_service_config               |  http_service_config defines the config    |   list  |    ""   |    yes       |
|request_parameters               |  Request_parameters defines .   |   list  |    ""   |    no       |
|stage_names               |  Stages that the api need to be deployed. Valid value: RELEASE，PRE and TEST.   |   list  |    ""   |    no       |

## Outputs

| Name | Description |
|------|-------------|
| api_id    |     the ID of api-gateway API        |
