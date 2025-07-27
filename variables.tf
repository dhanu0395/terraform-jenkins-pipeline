variable "add_file_one_name" {
	type = string
	description = "Name of the first file to create (e.g., dev-config.txt)."
}

variable "file_one_content" {
	type = string
	description = "Content for the first file."
}

variable "add_file_two_name"{
	type = string
	description = "Name of the second file to create (e.g., deployment-log.txt)."

}

variable "file_two_content" {
	type = string
	description = "Content for the second file."
}

variable "first_dir_name" {
	type = string
	description = "Name of the first directory to create (e.g., terraform-output-dir)."
}

variable "second_dir_name" {
	type = string
	description = "Name of the second directory to create (e.g., terraform-temp-dir)."
}
