resource "aws_eks_node_group" "nodes" {

  cluster_name = aws_eks_cluster.eks.name

  node_group_name = "${var.project_name}-nodes"

  node_role_arn = aws_iam_role.node_role.arn

  subnet_ids = [
    aws_subnet.private_1.id,
    aws_subnet.private_2.id
  ]

  capacity_type = "ON_DEMAND"

  instance_types = ["t3.medium"]

  scaling_config {

    desired_size = 2

    max_size = 3

    min_size = 2

  }

  depends_on = [

    aws_iam_role_policy_attachment.worker_policy,

    aws_iam_role_policy_attachment.cni_policy,

    aws_iam_role_policy_attachment.ecr_policy

  ]

}






resource "aws_eks_cluster" "eks" {

  name = "${var.project_name}-cluster"

  role_arn = aws_iam_role.eks_cluster_role.arn

  version = "1.31"

  vpc_config {

    subnet_ids = [
      aws_subnet.private_1.id,
      aws_subnet.private_2.id,
      aws_subnet.public_1.id,
      aws_subnet.public_2.id
    ]

    endpoint_private_access = true
    endpoint_public_access  = true

  }

  depends_on = [
    aws_iam_role_policy_attachment.cluster_policy
  ]

}


