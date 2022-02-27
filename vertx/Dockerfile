FROM ghcr.io/graalvm/graalvm-ce:ol8-java17-22.0.0.2

RUN microdnf install maven && mvn -version

WORKDIR /web

COPY mvnw .
COPY pom.xml .
COPY src src/

RUN mvn clean package

CMD ["mvn", "clean", "compile", "exec:java"]
