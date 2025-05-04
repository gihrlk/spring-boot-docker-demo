# Spring Boot Docker Demo

A production-ready Spring Boot application with Docker, PostgreSQL, and Nginx.

## Features

- Spring Boot 3.4.5 (Java 21)
- PostgreSQL 16 with persistent storage
- Nginx reverse proxy
- Docker Compose orchestration
- Health checks for all services
- Automatic container restart
- Data persistence

## Prerequisites

- Docker
- Docker Compose
- Java 21 (for local development)
- Maven (for local development)

## Quick Start

1. Clone the repository:
```bash
git clone https://github.com/gihrlk/spring-boot-docker-demo.git
cd spring-boot-docker-demo
```

2. Start the application:
```bash
docker-compose up -d
```

3. Access the application:
- API: http://localhost/users
- Database: localhost:5432 (demo database)

## API Endpoints

- `GET /users` - Get all users
- `POST /users` - Create a new user
- `GET /users/{id}` - Get user by ID

## Project Structure

```
.
├── src/                    # Spring Boot application source
├── docs/                   # Documentation
├── scripts/                # Utility scripts
├── nginx.conf             # Nginx configuration
├── docker-compose.yml     # Docker Compose configuration
├── Dockerfile            # Multi-stage Docker build
└── pom.xml               # Maven configuration
```

## Development

### Local Development

1. Start the database:
```bash
docker-compose up -d db
```

2. Run the Spring Boot application:
```bash
./mvnw spring-boot:run
```

### Building the Docker Image

```bash
docker-compose build
```

## Production Considerations

- Add SSL/TLS configuration in Nginx
- Implement proper secrets management
- Set up monitoring and logging
- Configure backup strategies
- Add rate limiting

## License

MIT 