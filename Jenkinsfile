pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                // Étape de déploiement avec Docker Compose
                sh 'docker-compose build'
            
            }
        }

        stage('Deploy') {
            steps {
                // Étape de déploiement avec Docker Compose
                sh 'docker-compose up -d'
            
            }
        }

    }
    post {
        success {
            // Envoyer une notification par e-mail si le déploiement est réussi
               emailext body: 'Votre application est déployée avec succés', subject: 'Result de mon build', to: 'dkhadidiatou75@gmail.com'
        }
    }
}






