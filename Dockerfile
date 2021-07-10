FROM tomcat:8.5.69-jdk8-adoptopenjdk-openj9

ADD target/HelloWorldJavaEE-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/HelloWorldJavaEE.war

EXPOSE 8080

CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
