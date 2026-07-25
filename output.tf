output "alb_dns_name" {
  description = "Click on this URL to reach your application"
  value       = module.loadBalancer.loadbalancerdns
}

output "vpc_id" {
  value = module.vpc.vpc
}
