pipeline {
    agent any

    stages {
       
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
            emailext (
                subject: "Déploiement réussi",
                body: "Le déploiement de l'application a été effectué avec succès.",
                to: "dkhadidiatou75@email.com",
            )
        }
    }
}






