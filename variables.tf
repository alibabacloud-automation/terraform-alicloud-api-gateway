variable "region" {
  description = "(Deprecated from version 1.2.0) The region used to launch this module resources."
  default     = ""
}

# ApiGateway api group variables
variable "api_group_name" {
  description = "The name of a api group."
  type        = string
  default     = ""
}

variable "api_group_description" {
  description = "The description of the api gateway group."
  type        = string
  default     = ""
}

# ApiGateway api variables
variable "api_name" {
  description = "The name of a api."
  type        = string
  default     = ""
}

variable "api_description" {
  description = "The description of the api."
  type        = string
  default     = ""
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
  default = []
}

variable "api_service_type" {
  description = "The type of backend service."
  type        = string
  default     = "HTTP"
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
  default = []
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
  default = []
}

variable "api_stage_name" {
  description = "Stages that the api need to be deployed."
  type        = list(string)
  default = [
    "RELEASE",
    "PRE",
    "TEST",
  ]
}