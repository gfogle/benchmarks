FROM ghcr.io/graalvm/graalvm-ce:ol8-java17-22.0.0.2

ARG MAVEN_VERSION=3.6.3
ARG BASE_URL=https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries

RUN microdnf install curl \
 && which curl \
 && microdnf install tar \
 && which tar

RUN mkdir -p /usr/share/maven /usr/share/maven/ref \
 && curl -fsSL -o /tmp/apache-maven.tar.gz ${BASE_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
 && tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 \
 && rm -f /tmp/apache-maven.tar.gz \
 && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

WORKDIR /web

COPY mvnw .
COPY pom.xml .
COPY src src/

RUN mvn clean package

#CMD ["mvn", "compile", "quarkus:dev"]
CMD ["java", "-jar", "/web/target/quarkus-app/quarkus-run.jar"]
