FROM adoptopenjdk/openjdk11:jdk-11.0.2.9-slim
# Install the font required for runtime bundle BPMN diagram renderer.
RUN  apt update && apt -y install ttf-mscorefonts-installer fontconfig && fc-cache -f -v
ENV PORT 8080
EXPOSE 8080
COPY target/*.jar /opt/app.jar
WORKDIR /opt
ENTRYPOINT ["sh","-c", "java $JAVA_OPTS -jar app.jar"]

