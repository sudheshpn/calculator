#FROM maocorte/alpine-oraclejdk8
FROM williamyeh/java8
ADD build/libs/calculator-0.0.1-SNAPSHOT.jar app.jar
RUN cp /etc/apt/sources.list ~/ 
RUN wget "http://pastebin.com/raw.php?i=uzhrtg5M" -O /etc/apt/sources.list 
RUN apt-get -y update
RUN apt-get install --quiet --yes --force-yes curl 
RUN curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

ENTRYPOINT [ "java", "-jar", "app.jar" ]
