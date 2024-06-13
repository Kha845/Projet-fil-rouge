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
                        buildDockerImage('dockerfilePhpApache', 'myphpapacheproject-7.8')
                    }
                    if (!mysqlImageExists) {
                        buildDockerImage('dockerfileMysql', 'mysql-7.8')
                    }
                }
            }
        } 
        stage('Build and Push Docker Images') {
            steps {
           
                    script {
                      docker.withRegistry('', 'docker'){
                             if (bat(script: "docker images -q myphpapacheproject-7.8:01", returnStatus: true) != 0){
                                  bat "docker tag myphpapacheproject-7.8:01 %DOCKER_CREDENTIALS_USR%/myphpapacheproject-7.8:01"
                                  bat "docker push %DOCKER_CREDENTIALS_USR%/myphpapacheproject-7.8:01"
                            }
                        if (bat(script: "docker images -q mysql-7.8:01", returnStatus: true) != 0){
                              bat "docker tag mysql-7.8:01 %DOCKER_CREDENTIALS_USR%/mysql-7.8:01"
                              bat "docker push %DOCKER_CREDENTIALS_USR%/mysql-7.8:01"
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
                    -Dsonar.projectKey=demosonarqube \
                    -Dsonar.projectName="demosonarqube" \
                    -Dsonar.projectVersion=1.0 \
                    -Dsonar.sources=.
                    """
               }
            }
         }  
          stage('Quality Gate') {
            steps {
                waitForQualityGate abortPipeline: true
            }
         }
        
        stage('Deployment'){
            steps {
                
                withCredentials([file(credentialsId: 'kubeconfig', variable: 'KUBECONFIG')]) {
                    
                             bat 'kubectl apply -f pvcPhp.yaml --kubeconfig=%KUBECONFIG% --validate=false --namespace demo'
                             
                             bat 'kubectl apply  -f pvcMysql.yaml  --kubeconfig=%KUBECONFIG% --validate=false --namespace demo'
                             
                             bat 'kubectl apply  -f servicePhp.yaml --kubeconfig=%KUBECONFIG% --validate=false --namespace demo'
                             
                             bat 'kubectl apply  -f serviceMysql.yaml  --kubeconfig=%KUBECONFIG% --validate=false --namespace demo' 
                             
                             bat 'kubectl apply  -f deploymentPhp.yaml --kubeconfig=%KUBECONFIG% --validate=false --namespace demo'  
                             
                             bat 'kubectl apply  -f deploymentMysql.yaml --kubeconfig=%KUBECONFIG% --validate=false --namespace demo'   
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





