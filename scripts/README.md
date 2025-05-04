# Utility Scripts

This directory contains utility scripts for managing and maintaining the Spring Boot Docker Demo application.

## Available Scripts

### verify-backup.sh

A script to verify the integrity of PostgreSQL database backups.

**Usage:**
```bash
./verify-backup.sh <backup-file>
```

**Example:**
```bash
./verify-backup.sh ./backups/db-backup-2024-03-20.sql
```

**Features:**
- Creates a temporary database for verification
- Restores the backup to the temporary database
- Verifies table structure and data
- Cleans up after verification
- Includes error handling and validation

**Prerequisites:**
- Docker Compose running
- PostgreSQL container up and running
- Valid backup file in SQL format

## Adding New Scripts

When adding new scripts to this directory:
1. Include a shebang line (`#!/bin/bash` for bash scripts)
2. Add proper error handling
3. Include usage instructions in comments
4. Make the script executable (`chmod +x script.sh`)
5. Update this README with documentation

## Best Practices

1. Always use `set -e` to exit on errors
2. Include proper error messages
3. Clean up temporary resources
4. Use descriptive variable names
5. Add comments for complex operations
6. Test scripts thoroughly before committing 