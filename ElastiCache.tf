resource "aws_elasticache_subnet_group" "cache_subnets" {
  name       = "tf-test-cache-subnet"
  subnet_ids = [module.network.subnet_id_pr1, module.network.subnet_id_pr2]
}

resource "aws_elasticache_security_group" "cache_sg" {
  name                 = "elasticache-security-group"
  security_group_names = [aws_security_group.allow-ssh.name, aws_security_group.allow-3000.name, aws_security_group.allow-3306.name, aws_security_group.allow-6379.name]

}

resource "aws_elasticache_cluster" "example" {
  cluster_id           = "cluster-example"
  engine               = "redis"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis3.2"
  engine_version       = "3.2.10"
  port                 = 6379
  security_group_ids   = [aws_security_group.allow-ssh.id, aws_security_group.allow-3000.id, aws_security_group.allow-3306.id, aws_security_group.allow-6379.id]

}