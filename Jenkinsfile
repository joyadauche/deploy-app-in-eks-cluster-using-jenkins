pipeline {
    agent any

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
    }
}

