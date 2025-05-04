# Development Environment Setup

This guide will help you set up your development environment for the Spring Boot Docker Demo application.

## Prerequisites

- Java 21 or later
- Maven 3.8 or later
- Docker and Docker Compose
- Git
- IDE (IntelliJ IDEA, Eclipse, or VS Code)

## Step 1: Clone the Repository

```bash
git clone https://github.com/gihrlk/spring-boot-docker-demo.git
cd spring-boot-docker-demo
```

## Step 2: IDE Setup

### IntelliJ IDEA
1. Open the project
2. Import as Maven project
3. Enable annotation processing
4. Configure Java 21 SDK
5. Install recommended plugins:
   - Docker
   - Spring Boot Assistant
   - Lombok

### VS Code
1. Open the project
2. Install extensions:
   - Spring Boot Extension Pack
   - Docker
   - Java Extension Pack
   - Lombok Annotations Support

## Step 3: Local Development

### Option 1: Run with Docker Compose
```bash
# Start all services
docker-compose up -d

# View logs
docker-compose logs -f

# Stop services
docker-compose down
```

### Option 2: Run Spring Boot Application Directly
```bash
# Start database only
docker-compose up -d db

# Run Spring Boot application
./mvnw spring-boot:run
```

## Step 4: Database Setup

1. Connect to PostgreSQL:
```bash
docker-compose exec db psql -U postgres -d demo
```

2. Verify tables:
```sql
\dt
SELECT * FROM users;
```

## Step 5: Testing

### Run Unit Tests
```bash
./mvnw test
```

### Run Integration Tests
```bash
./mvnw verify
```

### Run All Tests with Coverage
```bash
./mvnw clean verify jacoco:report
```

## Step 6: Development Workflow

1. Create a new branch:
```bash
git checkout -b feature/your-feature-name
```

2. Make changes and commit:
```bash
git add .
git commit -m "Description of changes"
```

3. Push changes:
```bash
git push origin feature/your-feature-name
```

4. Create a pull request

## Common Tasks

### Database Backup
```bash
./scripts/verify-backup.sh <backup-file>
```

### View Application Logs
```bash
docker-compose logs -f app
```

### Rebuild Application
```bash
docker-compose build app
```

### Check Application Health
```bash
curl http://localhost:8080/actuator/health
```

## Troubleshooting

### Common Issues

1. **Port Conflicts**
   - Check if ports 8080, 5432 are available
   - Stop conflicting services
   - Modify ports in docker-compose.yml if needed

2. **Database Connection Issues**
   - Verify PostgreSQL is running
   - Check connection settings in application.properties
   - Ensure database exists

3. **Build Issues**
   - Clean Maven cache: `./mvnw clean`
   - Update dependencies: `./mvnw dependency:purge-local-repository`
   - Check Java version: `java -version`

## Next Steps

1. Review the [Architecture Overview](../architecture/overview.md)
2. Read the [Testing Guide](testing.md)
3. Check the [Debugging Guide](debugging.md)
4. Review [Disaster Recovery](../disaster-recovery.md) procedures 