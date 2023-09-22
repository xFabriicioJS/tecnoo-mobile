# Use a imagem base Java 11
FROM openjdk:11-jre-slim

# Copie o arquivo JAR da sua aplicação para o contêiner
COPY target/sua-aplicacao.jar /app.jar

# Exponha a porta em que sua aplicação será executada
EXPOSE 8080

# Comando para iniciar sua aplicação Spring Boot
CMD ["java", "-jar", "/app.jar"]
