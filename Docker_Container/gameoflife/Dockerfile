#for gameoflife using tomcat-9 and jdk8

FROM tomcat:9-jdk8
LABEL author=laxman
ADD https://referenceapplicationskhaja.s3.us-west-2.amazonaws.com/gameoflife.war /usr/local/tomcat/webapps/gameoflife.war
EXPOSE 8080

# docker image build -t gol .
#  docker container run -d -p 35000:8080 --name laxman gol