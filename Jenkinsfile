pipeline {
    agent any
    environment{
           DOCKER_CREDENTIALS = credentials('docker')
    }
    stages {
        stage('Build') {
            steps {
                script {
                    dockerComposeBuild()
                }
            }
        }
        stage('Deploy') {
            steps {
                // Étape de déploiement avec Docker Compose
                script {
                    deployWithDockerCompose()
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

def dockerComposeBuild() {
    // Commande pour construire les images Docker avec Docker Compose
    sh 'docker-compose build'
}

def deployWithDockerCompose() {
    // Commande pour démarrer les conteneurs avec Docker Compose
    sh 'docker-compose up '
}



