resource "aws_iam_user" "vault_dynamodb_backend" {
  name = "vault-dynamodb-backend-${var.env}"
  path = "/"
}

resource "aws_iam_policy" "vault_dynamodb_backend" {
  name        = "vault-dynamodb-backend-${var.env}"
  description = "Policy that allow Vault to handle DynamoDb Table"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "dynamodb:DescribeLimits",
        "dynamodb:DescribeTimeToLive",
        "dynamodb:ListTagsOfResource",
        "dynamodb:DescribeReservedCapacityOfferings",
        "dynamodb:DescribeReservedCapacity",
        "dynamodb:ListTables",
        "dynamodb:BatchGetItem",
        "dynamodb:BatchWriteItem",
        "dynamodb:CreateTable",
        "dynamodb:DeleteItem",
        "dynamodb:GetItem",
        "dynamodb:GetRecords",
        "dynamodb:PutItem",
        "dynamodb:Query",
        "dynamodb:UpdateItem",
        "dynamodb:Scan",
        "dynamodb:DescribeTable"
      ],
      "Effect": "Allow",
      "Resource": ["${aws_dynamodb_table.vault-backend.arn}" ]
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "vault_dynamodb_backend" {
  name       = "vault-dynamodb-backend-${var.env}"
  users      = [aws_iam_user.vault_dynamodb_backend.name]
  policy_arn = aws_iam_policy.vault_dynamodb_backend.arn
}

resource "aws_dynamodb_table" "vault-backend" {
  name           = "vault-backend-${var.env}"
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = "Path"
  range_key      = "Key"

  attribute {
    name = "Path"
    type = "S"
  }

  attribute {
    name = "Key"
    type = "S"
  }

  tags = {
    Name        = "vault-backend"
    Environment = var.env
  }
}

resource "aws_iam_access_key" "vault_dynamodb_backend" {
  user = aws_iam_user.vault_dynamodb_backend.name
}
