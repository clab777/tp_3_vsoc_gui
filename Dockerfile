FROM tomcat:9

#copy the war file into tomcat server
COPY target/*.war /usr/local/tomcat/webapps/
