# Disaster Recovery Plan

## Overview
This document outlines the procedures for recovering the Spring Boot application and its dependencies in case of a disaster.

## Recovery Time Objectives (RTO)
- Critical Systems: 4 hours
- Non-Critical Systems: 24 hours

## Recovery Point Objectives (RPO)
- Database: 24 hours (daily backups)
- Application: Real-time (stateless)

## Backup Strategy

1. Database Backups
   - Daily automated backups
   - Weekly full backups
   - Monthly archive backups
   - Backups stored in secure location

2. Application Data
   - Configuration files
   - User data
   - Application state

3. Infrastructure
   - Docker Compose configuration
   - Nginx configuration
   - Environment variables

## Recovery Procedures

### Database Recovery

1. Stop the application:
```bash
docker-compose down
```

2. Restore the database:
```bash
docker-compose up -d db
docker exec -i $(docker-compose ps -q db) psql -U postgres -d demo < backup.sql
```

3. Restart the application:
```bash
docker-compose up -d
```

### Application Recovery

1. Pull the latest code:
```bash
git pull origin main
```

2. Rebuild and restart:
```bash
docker-compose down
docker-compose build
docker-compose up -d
```

## Monitoring and Alerts

1. Database monitoring
   - Disk space
   - Connection count
   - Query performance
   - Backup status

2. Application monitoring
   - Response time
   - Error rates
   - Resource usage
   - Health checks

## Testing Recovery

1. Regular backup verification
2. Recovery drills
3. Performance testing after recovery

## Documentation

- Backup procedures
- Recovery procedures
- Contact information
- Escalation procedures

## Kubernetes Deployment

For Kubernetes-specific disaster recovery procedures, see the [spring-boot-docker-demo-k8s](https://github.com/gihrlk/spring-boot-docker-demo-k8s) repository.

## Communication Plan

### Internal Communication
1. Alert DevOps team
2. Notify development team
3. Update status page

### External Communication
1. Update customer-facing status page
2. Send email notifications
3. Post updates on social media

## Contact Information

### Primary Contacts
- DevOps Lead: [Name] - [Phone]
- Database Administrator: [Name] - [Phone]
- Application Owner: [Name] - [Phone]

### Escalation Path
1. DevOps Team
2. CTO
3. CEO

## Maintenance

### Regular Updates
- Review and update this document quarterly
- Update contact information as needed
- Document lessons learned from incidents

### Training
- Conduct DR training annually
- Document training sessions
- Update procedures based on feedback 