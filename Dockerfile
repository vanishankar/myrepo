FROM tomcat:latest
COPY ./webapp.war /usr/local/tomcat/webapps/home/dockeradmin/webapp.war
RUN cp -r /usr/local/tomcat/webapps.dist/* /usr/local/tomcat/webapps
