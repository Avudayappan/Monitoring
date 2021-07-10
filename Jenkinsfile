pipeline {
    agent any
    environment {
        registry = "608310603824.dkr.ecr.us-east-2.amazonaws.com/6c8f5ec-1ce1-4e94-80c2-aws"
    }
   
    stages {
        stage('Cloning Git') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/master']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[credentialsId: '', url: 'https://github.com/akannan1087/myPythonDockerRepo']]])     
            }
        }
  
    // Building Docker images
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry
        }
      }
    }
   
    // Uploading Docker images into AWS ECR
    stage('Pushing to ECR') {
     steps{  
         script {
                sh 'aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 608310603824.dkr.ecr.us-east-2.amazonaws.com'
                sh 'docker push 608310603824.dkr.ecr.us-east-2.amazonaws.com/6c8f5ec-1ce1-4e94-80c2-aws:latest'
         }
        }
      }
