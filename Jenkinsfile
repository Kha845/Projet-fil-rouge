pipeline {
    agent any

    stages {

    stage('SonarQube analysis') {
      steps {
        script {
          // Remplacez 'SonarQubeScanner' par le nom que vous avez donné à l'installation de SonarQube Scanner dans la configuration des outils globaux
          scannerHome = tool 'sonarscanner'
        }
        withSonarQubeEnv('sonarqube') {
          // Remplacez 'SonarQubeServer' par le nom de votre configuration de serveur SonarQube dans Jenkins
          bat "${scannerHome}/bin/sonar-scanner"
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






