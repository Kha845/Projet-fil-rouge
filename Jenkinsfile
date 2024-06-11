pipeline {
    agent any
    stages {
        stage('SonarQube analysis') {
          steps {
              script{
                   scannerHome = tool 'sonarscanner'
              }
             
             withSonarQubeEnv('sonarqube') {// If you have configured more than one global server connection, you can specify its name as configured in Jenkins
                 sh """
                    ${scannerHome}/bin/sonar-scanner \
                    sonar-scanner.bat
                    -Dsonar.projectKey=test-projectFilRouge \
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






