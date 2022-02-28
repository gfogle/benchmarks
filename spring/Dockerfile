FROM ghcr.io/graalvm/graalvm-ce:ol8-java17-22.0.0.2

ARG MAVEN_VERSION=3.6.3
ARG BASE_URL=https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries

RUN microdnf install curl \
 && microdnf install tar \
 && mkdir -p /usr/share/maven /usr/share/maven/ref \
 && curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
 && tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 \
 && rm -f /tmp/apache-maven.tar.gz \
 && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn \
 && gu install native-image

WORKDIR /web

COPY mvnw .
COPY pom.xml .
COPY src src/

RUN mvn clean -DskipTests package
# RUN mvn clean package -Pnative -DskipTests

# CMD ["mvn", "compile", "spring-boot:run"]
CMD ["java", "-jar", "/web/target/sbench-0.0.1-SNAPSHOT.jar"]
# CMD ["sh", "-c", "/web/target/sbench"]
