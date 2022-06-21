output "kubeconfig_filename" {
  description = "EKS kubeconfig file name"
  value       = module.eks.kubeconfig_filename
}

output "f5_xc_aws_vpc_site" {
  description = "F5 XC AWS VPC Site"
  value       = volterra_aws_vpc_site.this[each.key].name
}
