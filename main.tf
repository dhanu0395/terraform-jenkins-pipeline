terraform {
	required_providers{
		local = {
			source = "hashicorp/local"
			}
		}
	}

# Resource to create the first file

resource "local_file" "dev_config_file" {
	filename = "${path.cwd}/${var.add_file_one_name}"
	content = var.file_one_content
}

# Resource to create the second file

resource "local_file" "deployment_log_file" {
        filename = "${path.cwd}/${var.add_file_one_name}"
        content = var.file_two_content
}

# Resource to create the first directory
resource "local_directory" "output_directory" {
	path = "${path.cwd}/${var.first_dir_name}"
}

# Resource to create the second directory

resource "local_directory" "temp_directory" {
        path = "${path.cwd}/${var.second_dir_name}"
}

# Output blocks to display the paths of the created resources after 'terraform apply'
# These outputs are useful for verification in the Jenkins console.

output "created_app_config_file_path" {
  value       = local_file.dev_config_file.filename
  description = "Path to the created dev configuration file."
}

output "created_deployment_log_file_path" {
  value       = local_file.deployment_log_file.filename
  description = "Path to the created deployment log file."
}

output "created_output_directory_path" {
  value       = local_directory.output_directory.path
  description = "Path to the first created output directory."
}

output "created_temp_directory_path" {
  value       = local_directory.temp_directory.path
  description = "Path to the second created temporary directory."
}


