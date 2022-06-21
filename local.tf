locals {
  eks_subnets    = [for key, val in var.aws_subnet_eks_cidr : aws_subnet.eks[key].id]
  kubeconfig_b64 = data.local_file.kubeconfig.content_base64
  namespace      = var.volterra_namespace_exists ? join("", data.volterra_namespace.this.*.name) : join("", volterra_namespace.this.*.name)
  vpc_id             = var.eks_only ? var.vpc_id : aws_vpc.this[var.skg_name].id
  inside_subnet_cidr = var.aws_subnet_ce_cidr == {} ? ["127.0.0.1/32"] : [lookup(var.aws_subnet_ce_cidr, "inside", "127.0.0.1/32")]
}
