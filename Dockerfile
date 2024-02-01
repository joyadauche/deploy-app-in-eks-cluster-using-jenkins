FROM openjdk:17-jdk-alpine
ARG JAR_FILE=target/*.jar
RUN addgroup -S pipeline && adduser -S pipeline -G pipeline
COPY ${JAR_FILE} /home/pipeline/app.jar
USER pipeline
EXPOSE 8080
ENTRYPOINT ["java","-jar","/home/pipeline/app.jar"]