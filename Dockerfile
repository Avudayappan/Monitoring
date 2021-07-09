FROM tomcat:8.0-alpine

ADD HelloWorldJavaEE-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/HelloWorldJavaEE.war

EXPOSE 8080

CMD [“catalina.sh”, “run”]
