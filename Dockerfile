FROM maocorte/alpine-oraclejdk8
ADD build/libs/calculator-0.0.1-SNAPSHOT.jar app.jar
RUN curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

ENTRYPOINT [ "java", "-jar", "app.jar" ]
