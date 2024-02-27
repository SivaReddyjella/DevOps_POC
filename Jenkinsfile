pipeline {
    agent any
  
    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/SivaReddyjella/JavaProject.git
'
            }
        }
 
        stage('Terraform Init') {
            steps {
                dir('TERRAFORM_POC') {
                    script {
                        sh 'terraform init'
                    }
                }
            }
        }
 
        stage('Terraform Plan') {
            steps {
                dir('TERRAFORM_POC') {
                    script {
                        sh 'terraform plan -out=tfplan'
                    }
                }
            }
        }
 
        stage('Terraform Apply') {
            steps {
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
