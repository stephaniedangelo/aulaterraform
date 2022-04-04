variable "resource_tags" {
	type = map(string)
	default = {}
}
locals {
	required_tags = {
		"project" = "impacta",
		"environment" = "prod",
		"cc" = "1231232"
	}
	tags = merge(var.resource_tags, local.required_tags)
}

variable "projeto"{
	
}

variable "env" {

}

locals{
	resource_name = format("%s_%s", var.projeto, var.env)
}

output "tags" {
	value = local.tags
}

output "nome" {
	value = local.resource_name
}
