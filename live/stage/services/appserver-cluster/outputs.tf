output "elb_dns_name" {
  value = "${module.appserver_cluster.elb_dns_name}"
}
