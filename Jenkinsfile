pipeline {
    agent any

    stages {
    
        stage('Deploy') {
            steps {
                // Étape de déploiement avec Docker Compose
                sh 'docker-compose up -d'
            
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
                emailext body: 'Votre application est déployée avec succès', subject: 'Email build for projet fil', to: 'dkhadidiatou75@gmail.com'
        }
    }
}






