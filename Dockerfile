FROM maven:latest as builder
RUN mkdir /home/sample_docker
COPY pom.xml /home/sample_docker
COPY src /home/sample_docker/src
WORKDIR /home/sample_docker
RUN mvn clean install


FROM --platform=linux/amd64 openjdk:17-alpine
COPY --from=builder /home/sample_docker/target/Sample_Docker_Project-1.0-SNAPSHOT.jar Sample_Docker_Project-1.0.jar
ENTRYPOINT ["java","-jar","/Sample_Docker_Project-1.0.jar"]