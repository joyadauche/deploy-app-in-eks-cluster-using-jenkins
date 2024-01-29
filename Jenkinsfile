pipeline {
    agent any

     environment {
        imageName = "joyadauche/jenkins-demo:${GIT_COMMIT}"
     }

    stages {
        stage('Build artefact') {
            steps {
                sh "mvn clean package -DskipTests=true"
                archive 'target/*.jar'
            }
        }
        stage('Test app and publish coverage reports') {
            steps {
                sh "mvn test"
            }
            post {
              always {
                junit 'target/surefire-reports/*.xml'
                jacoco execPattern: 'target/jacoco.exec'
              }
            }
        }
         stage('Build and push docker image') {
            steps {
                 withDockerRegistry([credentialsId: "docker-hub-repo"]) {
                      sh "docker build -t ${imageName} ."
                      sh "docker push ${imageName}"
                 }
            }
        }
    }
}

