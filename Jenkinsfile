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
                    docker.withRegistry("https://index.docker.io/v1", "dockerhubtukarthik"){
                        def image = docker.build("tukarthik")
                        image.push("latest")
                    }
                    
                }
            }
        }
    }
}
