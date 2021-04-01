pipeline {
    agent any

    parameters {
         string(name: 'tomcat_dev', defaultValue: '35.166.210.154', description: 'Staging Server')
         string(name: 'tomcat_prod', defaultValue: '34.209.233.6', description: 'Production Server')
    }

    triggers {
         pollSCM('* * * * *')
     }

stages{
        stage('Build'){
            steps {
                sh 'mvn clean package'
            }
            post {
                success {
                    echo 'Now Archiving...'
                    archiveArtifacts artifacts: '**/target/*.war'
        
                     }
                   }       
                }
        stage('docker'){
            steps {
                sh 'docker build -t xyz .'
                sh 'docker tag xyz gcr.io/dynamic-fulcrum-303503/tomcat'
                sh 'docker push gcr.io/dynamic-fulcrum-303503/tomcat'
                }
              }
         stage('deploy-helm'){
            steps {
                sh 'helm ls'
                sh 'helm install tomcat tomcat' 
            }
         }
            }
        }


