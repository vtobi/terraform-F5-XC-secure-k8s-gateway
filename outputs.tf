output "kubeconfig_filename" {
  description = "EKS kubeconfig file name"
  value       = local_file.this_kubeconfig.filename
}

output "f5_xc_aws_vpc_site" {
  description = "F5 XC AWS VPC Site"
  value       = values(volterra_aws_vpc_site.this)[*].name
}
