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
        }

        stage('Vulnerability checks') {
          steps {
            sh "mvn dependency-check:check"
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

        stage('Deploy app to EKS cluster'){
            when {
              expression {
                BRANCH_NAME == "master"
              }
            }
            environment {
              AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')
              AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
            }
            steps {
               withKubeConfig([credentialsId: 'kubeconfig']) {
                 sh "bash deploy.sh"
               }
            }
        }
    }

     post {
        always {
          junit 'target/surefire-reports/*.xml'
          jacoco execPattern: 'target/jacoco.exec'
          dependencyCheckPublisher pattern: 'target/dependency-check-report.xml'
        }
     }
}

