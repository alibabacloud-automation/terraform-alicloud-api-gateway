# ApiGateway api group variables
variable "api_group_name" {
  description = "The name of a api group."
  type        = string
  default     = "tf_testacc_group"
}

variable "api_group_description" {
  description = "The description of the api gateway group."
  type        = string
  default     = "tf-testacc-group-description"
}

# ApiGateway api variables
variable "api_name" {
  description = "The name of a api."
  type        = string
  default     = "tf_testacc_api"
}

variable "api_description" {
  description = "The description of the api."
  type        = string
  default     = "tf-testacc-api-description"
}

variable "api_auth_type" {
  description = "The authorization Type including APP and ANONYMOUS."
  type        = string
  default     = "APP"
}

variable "api_request_config" {
  description = "Request_config defines how users can send requests to your API."
  type = list(object({
    protocol = string
    method   = string
    path     = string
    mode     = string
  }))
  default = [
    {
      protocol = "HTTP"
      method   = "GET"
      path     = "/test/path"
      mode     = "MAPPING"
    },
  ]
}

variable "api_http_service_config" {
  description = "http_service_config defines the config when service_type selected 'HTTP'."
  type = list(object({
    address   = string
    method    = string
    path      = string
    timeout   = number
    aone_name = string
  }))
  default = [
    {
      address   = "http://apigateway-backend.alicloudapi.com:8080"
      method    = "GET"
      path      = "/web/cloudapi"
      timeout   = 12
      aone_name = "cloudapi-openapi"
    },
  ]
}

variable "api_request_parameters" {
  description = "request_parameters defines the request parameters of the api."
  type = list(object({
    name         = string
    type         = string
    required     = string
    in           = string
    in_service   = string
    name_service = string
  }))
  default = [
    {
      name         = "test"
      type         = "STRING"
      required     = "REQUIRED"
      in           = "QUERY"
      in_service   = "QUERY"
      name_service = "testparams"
    },
  ]
}

variable "api_stage_name" {
  description = "Stages that the api need to be deployed."
  type        = list(string)
  default = [
    "RELEASE"
  ]
}