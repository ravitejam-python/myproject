FROM openjdk:11
EXPOSE 8080
ADD target/mynewproject-1.0.0-SNAPSHOT.war jenkins-automation
ENTRYPOINT ["java","-war","/jenkins-automation"]
