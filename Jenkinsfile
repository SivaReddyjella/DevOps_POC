pipeline {
    agent any

    parameters {
        choice(name: 'TERRAFORM_ACTION', choices: ['apply', 'destroy'], description: 'Select Terraform Action')
        string(name: 'SERVER_NAME', defaultValue: 'your_server_name_here', description: 'Enter Server Name')
    }

    stages {
        stage('Checkout') {
            steps {
                script {
                    // Checkout the repository
                    checkout([$class: 'GitSCM', branches: [[name: 'dev']], userRemoteConfigs: [[url: 'https://github.com/SivaReddyjella/DevOps_POC.git']]])
                }
            }
        }

        stage('Terraform Init') {
            steps {
                script {
                    // Change to the Terraform directory
                    dir('DevOps_POC/Terraform') {
                        // Initialize Terraform with potential state migration
                        sh 'terraform init -reconfigure'
                    }
                }
            }
        }

        stage('Terraform Apply/Destroy') {
            steps {
                script {
                    // Change to the Terraform directory
                    dir('DevOps_POC/Terraform') {
                        // Set the Terraform variable for server name
                        sh "terraform apply -auto-approve -var 'name=${params.SERVER_NAME}'" 
                        // Apply or destroy based on user input
                        if (params.TERRAFORM_ACTION == 'apply') {
                            sh 'terraform apply -auto-approve'
                        } else if (params.TERRAFORM_ACTION == 'destroy') {
                            sh 'terraform destroy -auto-approve'
                        } else {
                            echo 'Invalid action provided. Use "apply" or "destroy".'
                        }
                    }
                }
            }
        }
    }
}
