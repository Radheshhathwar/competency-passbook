FROM openjdk:8

RUN apt-get update \
    && apt-get install -y \
        curl \
        libxrender1 \
        libjpeg62-turbo \
        fontconfig \
        libxtst6 \
        xfonts-75dpi \
        xfonts-base \
        xz-utils

COPY target/compentency-passbook-0.0.1-SNAPSHOT.jar /opt/
#HEALTHCHECK --interval=30s --timeout=30s CMD curl --fail http://localhost:7001/actuator/health || exit 1
CMD ["java", "-XX:+PrintFlagsFinal", "-XX:+UnlockExperimentalVMOptions", "-XX:+UseCGroupMemoryLimitForHeap", "-jar", "/opt/compentency-passbook-0.0.1-SNAPSHOT.jar"]
