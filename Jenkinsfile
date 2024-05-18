pipeline {
    agent any

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
        stage('notification slack'){
            
                slackSend channel: '#test', color: 'good', message: 'welcome to jenkins, 
                slack', notifyCommitters: true, teamDomain: 'notification depuis jenkins', tokenCredentialId: 'configjenkins'
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






