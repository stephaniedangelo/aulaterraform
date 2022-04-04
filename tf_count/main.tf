provider "aws" {
	region = "us-east-1"
}

variable "usernames" {
	type = list
	default = [
		"leo",
		"stephanie",
	]
}

resource "aws_iam_user" "names" {
	count = length(var.usernames)
	name = var.usernames[count.index]
}
