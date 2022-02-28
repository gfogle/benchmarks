FROM ghcr.io/graalvm/graalvm-ce:ol8-java17-22.0.0.2

RUN microdnf install maven && mvn -version \
 && gu install native-image

WORKDIR /web

COPY mvnw .
COPY pom.xml .
COPY src src/

RUN mvn clean package
# RUN mvn clean package -DskipTests \
#  && native-image -jar target/vbench-1.0.0-SNAPSHOT-fat.jar

CMD ["mvn", "clean", "compile", "exec:java"]
