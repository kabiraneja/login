FROM kabiraneja/ubuntu-java-maven
EXPOSE 9090
COPY demo-1-build.jar /
# RUN cd /root && java -jar demo-1-build.jar
# ENTRYPOINT ["java","-jar","demo-1-build.jar"]
