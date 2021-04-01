FROM tomcat
COPY **/target/**.war /webapps/
EXPOSE 8080
CMD ["catalina.sh", "run"]
