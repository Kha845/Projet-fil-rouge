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
        stage('Copy Project Files') {
            steps {
                script {
                    // Copier les fichiers du projet dans le répertoire du serveur web
                    docker.container('php82').inside {
                        sh 'cp -r /projectProfil/* /var/www/html/'
                    }
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
                to: "dkhadidiatou75@gmail.com",
            )
        }
    }
}






