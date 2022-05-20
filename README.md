# Terraform-socat README

Cloud Legends terraform module for [socat](https://linux.die.net/man/1/socat) deployment in Kubernetes

Usage:

```hcl-terraform
module "socat" {
  source           = "git@github.com:cloud-legends/terraform-kubernetes-socat.git?ref=1.0"
  deploy_suffix    = "rds"
  namespace        = "application_namespace"
  endpoint         = "endpoint url"
  destination_port = port number
  source_port      = port number
  protocol         = "TCP"
}
```

## Configuration:
Simple terraform code that creates a Kubernetes deployment.
The deployment consists of 1 pod based on alpine that runs socat 

Socat is configured to accept `TCP` or `UDP` traffic on an incoming port that is exposed on the pod
It then forwards the traffic towards an endpoint of choice.
## Result:
You can port-forward to the resulting pod(s) using `kubectl` and use a local database client to interface with the endpoint even if a direct connection from your machine is not allowed in the network itself.

## visual representation:
![](./_images/socat.png)
