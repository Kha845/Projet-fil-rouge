pipeline {
    agent any
    environment {
        
        SLACK_CHANNEL = '#test'
        SLACK_CREDENTIALS_ID = 'configSLACK'
        }

    stages {
        stage('Build') {
            steps {
                // Étape de construction de l'image Docker
                script {
                  bat 'docker build -f dockerfilePhpApache -t kha458/myphpapacheproject-7.8:01 .'
                  bat 'docker build -f dockerfileMysql -t kha458/dbe-mysql-7.8 .'
                }
            }
        }
        stage('Terraform init') {
            steps {
                // Étape de déploiement avec Docker Compose
                script {
                    bat 'terraform init'
                }
            }
        }
        stage('Terraform plan') {
            steps {
                // Étape de déploiement avec Docker Compose
                script {
                    bat 'terraform plan'
                }
            }
        }
         stage('Terraform apply') {
            steps {
                // Étape de déploiement avec Docker Compose
                script {
                    bat 'terraform apply'
                }
            }
        }
    }
    post {
        success {
            slackSend(channel: '#build-notifications', color: 'good', message: "Build succeeded: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'")
        }
        failure {
            slackSend(channel: '#build-notifications', color: 'danger', message: "Build failed: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'")
        }
    }
}






