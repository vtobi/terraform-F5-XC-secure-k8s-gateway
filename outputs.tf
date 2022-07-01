output "kubeconfig_filename" {
  description = "EKS kubeconfig file name"
  value       = local_file.this_kubeconfig.filename
}

output "f5_xc_aws_vpc_site" {
  description = "F5 XC AWS VPC Site"
  value       = values(volterra_aws_vpc_site.this)[*].name
}

output "eks_host" {
  description = "EKS Host for Kubernetes provider configuration"
  value       = data.aws_eks_cluster.cluster.endpoint
}

output "eks_cluster_ca_certificate" {
  description = "EKS Cluster CA Cert for Kubernetes provider configuration"
  value       = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
}

output "eks_token" {
  description = "EKS token for Kubernetes provider configuration"
  value       = data.aws_eks_cluster_auth.cluster.token
}
