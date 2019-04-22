FROM maocorte/alpine-oraclejdk8
ADD build/libs/calculator-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT [ "java", "-jar", "app.jar" ]
