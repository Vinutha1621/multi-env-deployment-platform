resource "aws_iam_role" "eks_cluster_role" {
  name = "${var.project_name}-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"

    Statement = [{
      Action = "sts:AssumeRole"

      Effect = "Allow"

      Principal = {
        Service = "eks.amazonaws.com"
      }
    }]
  })
}


resource "aws_iam_role_policy_attachment" "cluster_policy" {

  role = aws_iam_role.eks_cluster_role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"

}


resource "aws_iam_role" "node_role" {

  name = "${var.project_name}-node-role"

  assume_role_policy = jsonencode({

    Version = "2012-10-17"

    Statement = [{

      Action = "sts:AssumeRole"

      Effect = "Allow"

      Principal = {

        Service = "ec2.amazonaws.com"

      }

    }]

  })

}


resource "aws_iam_role_policy_attachment" "worker_policy" {

  role = aws_iam_role.node_role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"

}

resource "aws_iam_role_policy_attachment" "cni_policy" {

  role = aws_iam_role.node_role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"

}

resource "aws_iam_role_policy_attachment" "ecr_policy" {

  role = aws_iam_role.node_role.name

  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"

}


