provider "aws" {
  region = "us-east-2"
}

resource "aws_iam_user" "iamUser" {
  name = "myIamUser"

}

resource "aws_iam_policy" "iamPolicy"{
    policy =<<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": [
                "s3:GetObject",
                "ec2:RunInstances"
            ],
            "Resource": [
                "arn:aws:s3:::*/*",
                "arn:aws:ec2:*::image/*"
            ]
        }
    ]
}
EOF
}

resource "aws_iam_policy_attachment" "iamAttachment" {
  name = "policyAttach"
  policy_arn = aws_iam_policy.iamPolicy.id
  users = [aws_iam_user.iamUser.name]
}

output "policyArn" {
    value = aws_iam_policy.iamPolicy.id
}