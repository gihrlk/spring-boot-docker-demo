# Spring Boot Docker Demo

A production-ready Spring Boot application with Docker, demonstrating best practices for containerization, security, and monitoring.

## 🚀 Features

- Spring Boot 3.x with Java 21
- PostgreSQL database
- Docker containerization
- Traefik reverse proxy
- Prometheus monitoring
- Grafana dashboards
- Automated backups
- Security hardening
- High availability

## 📋 Prerequisites

- Java 21
- Docker and Docker Compose
- Maven

## 🏗️ Project Structure

```
spring-boot-docker-demo/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/example/demo/
│   │   │       ├── controller/
│   │   │       ├── repository/
│   │   │       ├── entity/
│   │   │       └── DemoApplication.java
│   │   └── resources/
│   │       └── application.yml
│   └── test/
├── Dockerfile
├── docker-compose.yml
├── prometheus.yml
├── pom.xml
└── README.md
```

## 🚀 Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/spring-boot-docker-demo.git
   cd spring-boot-docker-demo
   ```

2. Build and start the application:
   ```bash
   docker-compose up -d
   ```

3. Access the application:
   - API: http://localhost:8080
   - Prometheus: http://localhost:9090
   - Grafana: http://localhost:3000

## 🔧 Configuration

### Environment Variables

- `SPRING_DATASOURCE_URL`: Database connection URL
- `SPRING_DATASOURCE_USERNAME`: Database username
- `SPRING_DATASOURCE_PASSWORD`: Database password
- `JAVA_OPTS`: JVM options

### Docker Compose Services

- **app**: Spring Boot application
- **db**: PostgreSQL database
- **traefik**: Reverse proxy
- **prometheus**: Metrics collection
- **grafana**: Metrics visualization
- **backup**: Automated database backups

## 📊 Monitoring

The application includes comprehensive monitoring:

- Prometheus for metrics collection
- Grafana for visualization
- Spring Boot Actuator endpoints
- Container health checks

## 🔐 Security

- Container security hardening
- Network isolation
- Resource limits
- Read-only filesystems
- No privilege escalation

## 🛠️ Development

1. Make code changes
2. Rebuild the application:
   ```bash
   docker-compose build app
   docker-compose up -d
   ```

3. View logs:
   ```bash
   docker-compose logs -f app
   ```

## 📚 Documentation

For detailed documentation, check out our blog series:

1. [Spring Boot with Docker: A Beginner's Guide](https://engineeringinsight.substack.com/p/spring-boot-with-docker)
2. [Docker Deep Dive: Networking and Security](https://engineeringinsight.substack.com/p/docker-deep-dive)
3. [Advanced Docker Patterns for Spring Boot](https://engineeringinsight.substack.com/p/advanced-docker-patterns)
4. [CI/CD Pipeline for Dockerized Spring Boot](https://engineeringinsight.substack.com/p/cicd-pipeline)
5. [Production-Ready Docker Deployment](https://engineeringinsight.substack.com/p/production-ready-docker)

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details. 