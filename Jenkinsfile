pipeline {
    agent any

    environment {
        scannerHome = tool name: 'C:\sonar-scanner-cli-6.0.0.4432-windows\sonar-scanner-6.0.0.4432-windows'
    }
    stages {
            stage('Anayse code'){
                steps {
                withSonarQubeEnv('SonarQube') {
                    bat """
                    ${scannerHome}/bin/sonar-scanner \
                    -Dsonar.projectKey=test-projectFilRouge\
                    -Dsonar.projectName="test-projectFilRouge" \
                    -Dsonar.projectVersion=1.0 \
                    -Dsonar.sources=.
                    """
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
            // Envoyer une notification par e-mail si le déploiement est réussi
            emailext (
                subject: "Déploiement réussi",
                body: "Le déploiement de l'application a été effectué avec succès.",
                to: "dkhadidiatou75@email.com",
            )
        }
    }
}






