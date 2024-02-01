FROM openjdk:22-slim
ARG JAR_FILE=target/*.jar
RUN addgroup pipeline && adduser pipeline pipeline
COPY ${JAR_FILE} /home/pipeline/app.jar
USER pipeline
EXPOSE 8080
ENTRYPOINT ["java","-jar","/home/pipeline/app.jar"]