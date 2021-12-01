variable "namespace" {
  type        = string
  default     = ""
  description = "Name of the namespace in which the deployment should be placed"
}

variable "deploy_suffix" {
  type        = string
  default     = ""
  description = "Name of the destination you want to interface with, this is added to the name to ensure a unique name for the deployment"
}

variable "endpoint" {
  type        = string
  default     = ""
  description = "Address to which socat should forward traffic"
}

variable "destination_port" {
  type        = number
  description = "Port to which socat should forward the traffic"
}

variable "source_port" {
  type        = number
  description = "port on which socat should listen for traffic"
}

variable "protocol" {
  type        = string
  default     = ""
  description = "the protocol that socat should use, options are 'TCP' or 'UDP'"
}
