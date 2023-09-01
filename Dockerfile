FROM kabiraneja/ubuntu-java-maven
EXPOSE 8096
COPY login.jar /
# RUN cd /root && java -jar demo-1-build.jar
# ENTRYPOINT ["java","-jar","demo-1-build.jar"]
