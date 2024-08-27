FROM spark:3.5.2

USER root:root

RUN mkdir -p /app
RUN mkdir -p /opt/hadoop/conf
RUN mkdir -p /opt/spark/conf

COPY ./clickhouse-jdbc-0.6.4-shaded.jar /opt/spark/jars
COPY ./gcs-connector-hadoop3-latest.jar /opt/spark/jars
COPY ./postgresql-42.7.3.jar /opt/spark/jars
COPY ./core-site.xml /opt/hadoop/conf
COPY ./spark-env.sh $SPARK_HOME/conf

WORKDIR /app

ENTRYPOINT [ "/opt/entrypoint.sh" ]