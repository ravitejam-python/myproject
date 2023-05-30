pipeline{
    agent any
        tools{
            maven 'Maven3'
        }
    
    stages{
        stage('Build Maven'){
            steps{
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/ravitejam-python/myproject.git']])
                sh 'mvn clean install'
            }
        }
        stage('Build Docker Image'){
             steps{
                  script{
                    sh 'docker build -t ravitejamusinuridocker/jenkinsautomation1 .'
                  }
             }
        }
        
        stage('Push Docker Image to DOckerHub'){
            steps{
                 script{
                      withCredentials([string(credentialsId: 'docker-pwd', variable: 'Dockerpwd')]) {
                      sh 'docker login -u ravitejamusinuridocker -p ${Dockerpwd}'
                      }
                      sh 'docker push ravitejamusinuridocker/jenkinsautomation1'            
                 }
            }
        }
    }
    
}
