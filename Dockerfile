FROM tomcat:9

#copy the war file into tomcat
COPY target/*.war /usr/local/tomcat/webapps/
