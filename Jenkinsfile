pipeline {
    agent any

  
 
        stage('Terraform Init') {
            steps {
                // Navigate to the Terraform directory and initialize
                dir('TERRAFORM_POC') {
                    script {
                        sh 'terraform init'
                    }
                }
            }
        }
 
        stage('Terraform Plan') {
            steps {
                // Navigate to the Terraform directory and perform plan
                dir('TERRAFORM_POC') {
                    script {
                        sh 'terraform plan -out=tfplan'
                    }
                }
            }
        }
 
        stage('Terraform Apply') {
            steps {
                // Navigate to the Terraform directory and apply the changes
                dir('TERRAFORM_POC') {
                    script {
                        sh 'terraform apply -auto-approve tfplan'
                    }
                }
            }
        }
    }
 
    post {
        always {
            // Clean up workspace after job completion
            cleanWs()
        }
    }
}

