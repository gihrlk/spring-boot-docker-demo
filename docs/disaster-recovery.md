# Disaster Recovery

This document outlines the disaster recovery procedures for the Spring Boot Docker Demo application.

## Backup Strategy

### Database Backups

1. **Automated Backups**
   - Daily full backups
   - Weekly retention
   - Backup location: `/backups/postgres`

2. **Manual Backups**
   ```bash
   docker-compose exec db pg_dump -U postgres -d demo > backup_$(date +%Y%m%d).sql
   ```

### Application Data

1. **Configuration Files**
   - Backup `application.properties`
   - Backup `nginx.conf`
   - Backup `docker-compose.yml`

2. **Docker Volumes**
   - Backup PostgreSQL volume
   - Backup application logs

## Recovery Procedures

### Database Recovery

1. **From Automated Backup**
   ```bash
   docker-compose exec db psql -U postgres -d demo < backup_file.sql
   ```

2. **From Manual Backup**
   ```bash
   docker-compose exec db psql -U postgres -d demo < backup_YYYYMMDD.sql
   ```

### Application Recovery

1. **Restore Configuration**
   - Copy backed up configuration files
   - Update environment variables if needed

2. **Restart Services**
   ```bash
   docker-compose down
   docker-compose up -d
   ```

## Verification

1. **Database Verification**
   ```bash
   docker-compose exec db psql -U postgres -d demo -c "SELECT COUNT(*) FROM users;"
   ```

2. **Application Verification**
   ```bash
   curl http://localhost:8080/actuator/health
   ```

## Backup Verification

Use the provided script to verify backup integrity:
```bash
./scripts/verify-backup.sh <backup-file>
```

## Emergency Contacts

- Database Administrator: [Contact Info]
- System Administrator: [Contact Info]
- Application Support: [Contact Info]

## Recovery Time Objectives (RTO)

- Critical Systems: 4 hours
- Non-Critical Systems: 24 hours

## Recovery Point Objectives (RPO)

- Database: 24 hours
- Application Configuration: 24 hours
- Logs: 7 days

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