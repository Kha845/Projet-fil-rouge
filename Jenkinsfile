pipeline {
    agent any
    environment{
           DOCKER_CREDENTIALS = credentials('docker')
    }
    stages {
        stage('Check Docker Images') {
            steps {
                script {
                    def phpAppImageExists = bat(script: "docker pull %DOCKER_CREDENTIALS_USR%/myphpapacheproject-7.8:01 || exit /b 0", returnStatus: true) == 0
                    def mysqlImageExists = bat(script: "docker pull %DOCKER_CREDENTIALS_USR%/mysql-7.8:01 || exit /b 0", returnStatus: true) == 0
                    
                    if (!phpAppImageExists) {
                        buildDockerImage('App.Dockerfile', 'myphpapacheproject-7.8')
                    }
                    if (!mysqlImageExists) {
                        buildDockerImage('Db.Dockerfile', 'mysql-7.8')
                    }
                }
            }
        } 
        stage('Build and Push Docker Images') {
            steps {
                script {
                    docker.withRegistry('', 'docker') {
                        if (bat(script: "docker images -q  myphpapacheproject-7.8:01, returnStatus: true) != 0){
                            bat "docker tag  myphpapacheproject-7.8:01 %DOCKER_CREDENTIALS_USR%/myphpapacheproject-7.8:01"
                            bat "docker push  %DOCKER_CREDENTIALS_USR%/myphpapacheproject-7.8:01"
                        }
                        if (bat(script: "docker images -q  mysql-7.8:01", returnStatus: true) != 0){
                            bat "docker tag mysql-7.8:01 %DOCKER_CREDENTIALS_USR%/mysql-7.8:01"
                            bat "docker push  %DOCKER_CREDENTIALS_USR%/mysql-7.8:01"
                        }
                    }
                }
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
         stage('Terraform apply') {
            steps {
                // Étape de déploiement avec Docker Compose
                script {
                     bat 'terraform plan'
                    bat 'terraform init'
                    bat 'terraform apply -auto-approve'
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
 def buildDockerImage(dockerfile, imageName) {
           bat 'docker build -t %imageName%:latest -f %dockerfile% .'
            
}





