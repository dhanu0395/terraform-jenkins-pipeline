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
                dir('.') {
                    sh 'terraform init'
                }
            }
        }

        stage('Terraform validate') {
            steps {
                dir('.') {
                    sh 'terraform validate'
                }
            }
        }

        stage('Terraform plan') {
            steps {
                dir('.') {
                    sh 'terraform plan -out=tfplan'
                }
            }
        }

        stage('Terraform apply') {
            steps {
                dir('.') {
                    sh 'terraform apply -auto-approve tfplan'
                }
            }
        }
    }

    post {
        always {
           # deleteDir()
        }

        success {
            echo 'Terraform Infrastructure Pipeline finished successfully!'
        }

        failure {
            echo 'Terraform Infrastructure Pipeline failed! Check console output for errors.'
        }
    }
}

