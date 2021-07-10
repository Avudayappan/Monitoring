pipeline {
    agent any
    tools {
        maven 'Maven 3.3.9'
        jdk 'jdk8'
    }
    stages {
        stage ('Initialize') {
            steps {
                sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                '''
            }
        }

        stage ('Build') {
            steps {
                sh 'mvn -Dmaven.test.failure.ignore=true install' 
            }
        }

        stage('Create Image'){
            steps {
                script {
                    sh 'aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 608310603824.dkr.ecr.us-east-2.amazonaws.com'
                       sh 'docker push 608310603824.dkr.ecr.us-east-2.amazonaws.com/6c8f5ec-1ce1-4e94-80c2-aws:latest'
                        
                    }
                    
                }
            }
        }
    }
}
