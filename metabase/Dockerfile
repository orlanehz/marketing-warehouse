ARG METABASE_VERSION=0.52.9
ARG METABASE_DUCKDB_DRIVER_VERSION=0.3.1

FROM eclipse-temurin:21-jre-jammy

ARG METABASE_VERSION
ARG METABASE_DUCKDB_DRIVER_VERSION

ENV MB_PLUGINS_DIR=/plugins
ENV MB_JETTY_HOST=0.0.0.0

RUN mkdir -p /app /plugins /metabase-data

ADD https://downloads.metabase.com/v${METABASE_VERSION}/metabase.jar /app/metabase.jar
ADD https://github.com/MotherDuck-Open-Source/metabase_duckdb_driver/releases/download/${METABASE_DUCKDB_DRIVER_VERSION}/duckdb.metabase-driver.jar /plugins/duckdb.metabase-driver.jar

RUN chmod 755 /app/metabase.jar \
    && chmod 644 /plugins/duckdb.metabase-driver.jar

WORKDIR /app

EXPOSE 3000

CMD ["java", "-jar", "/app/metabase.jar"]
