resource "volterra_discovery" "eks" {
  for_each    = toset(var.eks_only ? [] : [var.skg_name])
  name        = var.skg_name
  description = "Discovery object to discover all services in eks cluster"
  namespace   = "system"
  depends_on  = [module.eks]

  where {
    site {
      ref {
        name      = var.skg_name
        namespace = "system"
      }
      network_type = "VIRTUAL_NETWORK_SITE_LOCAL_INSIDE"
    }
  }
  discovery_k8s {
    access_info {
      kubeconfig_url {
        secret_encoding_type = "EncodingNone"
        clear_secret_info {
          url = format("string:///%s", local.kubeconfig_b64)
        }
      }
      reachable = false
      isolated  = true
    }
    publish_info {
      disable = true
    }
  }
}

resource "local_file" "this_kubeconfig" {
  depends_on = [volterra_discovery.eks]
  content    = base64decode(local.kubeconfig_b64)
  filename   = format("%s/_output/kubeconfig", path.root)
}
