# Maven Build Stage
FROM maven:3.8.1-jdk-11-openj9 as build-stage

COPY . /project
WORKDIR /project

RUN mvn clean package


# Docker Image Build Stage
FROM ibmcom/websphere-liberty:kernel-java11-openj9-ubi

COPY --chown=1001:0  --from=build-stage /project/ejb-ear/target/ejb-ear.ear /config/apps/
COPY --chown=1001:0  --from=build-stage /project/ejb-ear/src/main/liberty/config/server.xml /config/

RUN configure.sh
