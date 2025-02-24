# Use the official Tomcat image
FROM tomcat:9.0

# Copy the WAR file into Tomcat's webapps directory
COPY target/ROOT.war /usr/local/tomcat/webapps/

# Expose port 8080 for the application
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
