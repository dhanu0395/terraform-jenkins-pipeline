pipeline {
    agent any

    tools {
        terraform "terraform_1.12.2"
    }

    stages {
        stage('Checkout SCM') {
            steps {
                git branch: 'main', url: 'https://github.com/dhanu0395/terraform-jenkins-pipeline.git'
                echo "Repository cloned successfully into Jenkins workspace: ${pwd()}"
            }
        }

        stage('Terraform init') {
            steps {
                dir('terraform-jenkins-pipeline') {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform validate') {
            steps {
                dir('terraform-jenkins-pipeline') {
                    sh 'terraform validate'
                }
            }
        }

        stage('Terraform plan') {
            steps {
                dir('terraform-jenkins-pipeline') {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Terraform apply') {
            steps {
                dir('terraform-jenkins-pipeline') {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }

    post {
        always {
            deleteDir()
        }

        success {
            echo 'Terraform Infrastructure Pipeline finished successfully!'
        }

        failure {
            echo 'Terraform Infrastructure Pipeline failed! Check console output for errors.'
        }
    }
}

