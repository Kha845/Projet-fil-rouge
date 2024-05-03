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
                sh 'docker cp . 4aa00aff21f9:/var/www/html/'
            
            }
        }
         stage('Test') {
            steps {
                // Étape de déploiement avec Docker Compose
                sh 'php projectProfil/index.php'
            
            }
        }
    }
    post {
        success {
            // Envoyer une notification par e-mail si le déploiement est réussi
            emailext (
                subject: "Déploiement réussi",
                body: "Le déploiement de l'application a été effectué avec succès.",
                to: "dkhadidiatou75@gmail.com",
            )
        }
    }
}






