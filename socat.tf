resource "kubernetes_deployment" "socat_deploy" {
  metadata {
    name      = "socat-proxy"
    namespace = local.application_namespace
    labels    = {
      app = "socat"
    }
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "socat"
      }
    }

    template {
      metadata {
        labels = {
          app = "socat"
        }
      }

      spec {
        container {
          image   = "alpine/socat"
          name    = "socat-proxy"
          command = ["/bin/sh"]
          # this way we can retrieve the endpoint from our own RDS module
          args    = ["-c","socat -d -d TCP-LISTEN:5432,fork TCP:${module.rds.aurora_write_endpoint}:5432"]

          resources {
            #I've gone ahead and set some defaults for this, ram usage is already very minimal
            # When passively listening for connections: 1318912 Bytes = 1.3189119999999999 MB
            # When having 1 connection active: 1818624 Bytes = 1.818624 MB
            
            limits = {
              cpu    = "100m"
              memory = "100mi"
            }
            requests = {
              cpu    = "20m"
              memory = "50Mi"
            }
          }
          
          port {
            # This is the port that will be available on the pod to accept a port forward.
            # We can change this if we want, for now this port works and is easy to remember.
            container_port = 5432
            protocol       = "TCP"
          }  
        }
      }
    }
  }
}
