FROM docker.io/adoptopenjdk/openjdk11:jdk-11.0.11_9-centos 
#RUN apk add --no-cache maven
WORKDIR /java
COPY . /java
RUN /java/mvnw install
#RUN mvn package -Dmaven.test.skip=true 
EXPOSE 8080
ENTRYPOINT ["java","-jar","/java/target/demo-0.0.1-SNAPSHOT.jar"]
