pipeline {
    agent any
    
    environment {
        AWS_ACCESS_KEY_ID     = 'AKIAQHZUKXXJSZ6CJWX2'
        AWS_SECRET_ACCESS_KEY = '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'
        AWS_DEFAULT_REGION    = 'us-west-2'
    }

    stages {
        stage('Checkout') {
            steps {
                git ' https://github.com/SivaReddyjella/DevOps_POC.git' // Update with your Git repository URL
            }
        }
        
        stage('Terraform Init') {
            steps {
                script {
                    sh 'terraform init'
                }
            }
        }
        
        stage('Terraform Plan') {
            steps {
                script {
                    sh 'terraform plan'
                }
            }
        }
        
        stage('Terraform Apply') {
            steps {
                script {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
    }
}
