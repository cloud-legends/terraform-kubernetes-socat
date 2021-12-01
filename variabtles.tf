variable "tcp_endpoint" {
  type        = string
  default     = ""
  description = "Address to which socat should forward traffic"
}

variable "destination_port" {
  type        = number
  default     = ""
  description = "Port to which socat should forward the traffic"
}

variable "source_port" {
  type        = number
  default     = ""
  description = "port on which socat should listen for traffic"
}

variable "protocol" {
  type        = string
  default     = ""
  description = "the protocol that socat should use, options are 'TCP' or 'UDP'"
}