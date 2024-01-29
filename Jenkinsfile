pipeline {
    agent any

    stages {
        stage('Build artefact') {
            steps {
                sh "mvn clean package -DskipTests=true"
                archive 'target/*.jar'
            }
        }
    }
}

