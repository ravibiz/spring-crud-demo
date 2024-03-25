FROM openjdk:17-jdk-alpine
WORKDIR /app
ADD https://github.com/open-telemetry/opentelemetry-java-instrumentation/releases/download/v1.30.0/opentelemetry-javaagent.jar /opt/opentelemetry-agent.jar
COPY target/demo-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT java -javaagent:/opt/opentelemetry-agent.jar -Dotel.resource.attributes=service.name=my-first-service -Dotel.exporter.otlp.headers=client_id=abc -Dotel.exporter.otlp.endpoint=http://otel-collector-local-host:4318 -jar app.jar