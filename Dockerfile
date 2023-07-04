FROM alpine:latest

# Install necessary dependencies
RUN apk update && apk add --no-cache openjdk17-jdk unzip postgresql postgresql-client

# Download and install Gradle
RUN wget https://services.gradle.org/distributions/gradle-8.1.1-bin.zip
RUN unzip gradle-8.1.1-bin.zip
RUN mkdir -p /opt/gradle 
RUN mv gradle-8.1.1 /opt/gradle

# Set environment variables
ENV PATH="/opt/gradle/gradle-8.1.1/bin:${PATH}"

# Start the PostgreSQL service
RUN mkdir /run/postgresql && chown postgres /run/postgresql
RUN su - postgres -c "initdb -D /var/lib/postgresql/data"
RUN su - postgres -c "pg_ctl -D /var/lib/postgresql/data -l /var/lib/postgresql/data/logfile start"

# Set the working directory
WORKDIR /app

# Expose the necessary ports
EXPOSE 5432
EXPOSE 8080

# Command to start the application
CMD ["gradle", "bootRun"]
