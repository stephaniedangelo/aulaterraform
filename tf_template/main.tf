provider "aws" {
	region = "us-east-1"
}

variable "curso" {
	type = string
}

variable "pacotes" {
	type = list
	default = ["docker","vim"]
}

data "aws_ecr_repository" "app1"{
	name = "stephanie"
}	

data "template_file" "user_data" {
	template = file("user_data.sh")
	vars = {
		curso = var.curso
		pacotes = join(" ",var.pacotes)
		docker-image = data.aws_ecr_repository.app1.repository_url
	}
}

output "user_data" {
	value = data.template_file.user_data.rendered
}


output "registry" {
	value = data.aws_ecr_repository.app1.repository_url
}
