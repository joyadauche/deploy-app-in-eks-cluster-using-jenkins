# Goal
Deploy application to an EKS cluster using Jenkins

# Sample App
The sample Java application created here was based on the guide from [spring.io](https://spring.io/guides/gs/spring-boot/)

# Pre-requisites
- [A running jenkins server with all the default plugins suggested installed](https://www.jenkins.io/doc/book/installing/)
- [A running EKS cluster](https://github.com/joyadauche/provision-eks-cluster-using-terraform)
- Ensure docker is installed on the jenkins server
- Ensure aws-iam-authenticator or aws cli (depends on what command you use in your kubeconfig file) is installed on the jenkins server
- Setup webhook for jenkins on your github repo to trigger a multi-branch pipeline build on push to the repo
- Setup maven installation via jenkins ui
- Install the following plugins on jenkins
  - docker-workflow
  - dependency-check-jenkins-plugin
  - jacoco
  - kubernetes-cli
  - blueocean
- Setup credentials on jenkins for the following and update the id accordingly in the jenkinsfile
  - dockerhub
  - github
  - kubeconfig
  - aws access key id
  - aws secret access key

# Run app locally
- `mvn clean test` to execute tests
- `mvn clean package` to build artefact (it also runs tests)
- `./mvnw spring-boot:run` to run app