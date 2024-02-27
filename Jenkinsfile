pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                script {
                    // Change working directory to TERRAFORM_POC
                    dir('TERRAFORM_POC') {
                        // Checkout your repository
                        git branch: 'main', credentialsId: 'your-credentials-id', url: 'https://github.com/SivaReddyjella/DevOps_POC.git' // Update with your Git repository URL and credentials ID
                    }
                }
            }
        }
        
        stage('Terraform Init') {
            steps {
                script {
                    // Change working directory to TERRAFORM_POC
                    dir('TERRAFORM_POC') {
                        // Execute terraform init
                        sh 'terraform init'
                    }
                }
            }
        }
        
        stage('Terraform Plan') {
            steps {
                script {
                    // Change working directory to TERRAFORM_POC
                    dir('TERRAFORM_POC') {
                        // Execute terraform plan and save the plan to tfplan file
                        sh 'terraform plan'
                    }
                }
            }
        }
        
        stage('Terraform Apply') {
            steps {
                script {
                    // Change working directory to TERRAFORM_POC
                    dir('TERRAFORM_POC') {
                        // Apply the changes using the plan file generated from terraform plan
                        sh 'terraform apply'
                    }
                }
            }
        }
    }
}
