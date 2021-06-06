FROM ibmcom/websphere-liberty:kernel-java11-openj9-ubi

COPY --chown=1001:0  config/apps/ejb-ear.ear /config/apps/
COPY --chown=1001:0  fromTA/server.xml /config/

RUN configure.sh
