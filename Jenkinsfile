pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                  //construction de l'image phpApache
                   bat 'docker build -f dockerfilePhpApache -t myphpapacheproject-7.8:01 . '
                   bat 'docker tag myphpapacheproject-7.8:01 kha458/myphpapacheproject-7.8:01'
                   bat 'docker push kha458/myphpapacheproject-7.8:01'
                   //construction de l'image mysql
                   bat 'docker build -f dockerMysql -t kha458/mysql-7.8:01'
                   bat  'docker tag mysql-7.8:01 kha458/mysql-7.8:01'
                   bat 'docker push kha458/mysql-7.8:01'
            }
        }
        stage('SonarQube analysis') {
          steps {
              script{
                   scannerHome = tool 'sonarscanner'
              }
             
             withSonarQubeEnv('sonarqube') {// If you have configured more than one global server connection, you can specify its name as configured in Jenkins
                 bat """
                    ${scannerHome}/bin/sonar-scanner \
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






