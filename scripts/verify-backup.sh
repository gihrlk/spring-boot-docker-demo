#!/bin/bash

# Backup verification script for PostgreSQL
# This script verifies the integrity of a PostgreSQL backup by:
# 1. Creating a temporary database
# 2. Restoring the backup to the temporary database
# 3. Running verification queries
# 4. Cleaning up the temporary database
#
# Usage: ./verify-backup.sh <backup-file>
# Example: ./verify-backup.sh ./backups/db-backup-2024-03-20.sql

set -e  # Exit on error

# Check if backup file is provided
if [ $# -ne 1 ]; then
    echo "Error: Backup file not provided"
    echo "Usage: $0 <backup-file>"
    exit 1
fi

BACKUP_FILE=$1
VERIFY_DB="verify_db_$(date +%s)"

# Check if backup file exists
if [ ! -f "$BACKUP_FILE" ]; then
    echo "Error: Backup file '$BACKUP_FILE' not found"
    exit 1
fi

# Check if docker-compose is running
if ! docker-compose ps | grep -q "db.*Up"; then
    echo "Error: PostgreSQL container is not running"
    echo "Please start the database with: docker-compose up -d db"
    exit 1
fi

echo "Starting backup verification..."

# Create temporary database for verification
echo "Creating verification database..."
if ! docker-compose exec -T db psql -U postgres -c "CREATE DATABASE $VERIFY_DB;"; then
    echo "Error: Failed to create verification database"
    exit 1
fi

# Restore backup to verification database
echo "Restoring backup to verification database..."
if ! docker-compose exec -T db psql -U postgres -d $VERIFY_DB < "$BACKUP_FILE"; then
    echo "Error: Failed to restore backup"
    docker-compose exec -T db psql -U postgres -c "DROP DATABASE IF EXISTS $VERIFY_DB;"
    exit 1
fi

# Verify the restore
echo "Verifying restore..."
echo "Checking tables..."
docker-compose exec -T db psql -U postgres -d $VERIFY_DB -c "\dt"

echo "Checking user count..."
docker-compose exec -T db psql -U postgres -d $VERIFY_DB -c "SELECT COUNT(*) as user_count FROM users;"

# Clean up
echo "Cleaning up..."
docker-compose exec -T db psql -U postgres -c "DROP DATABASE IF EXISTS $VERIFY_DB;"

echo "Backup verification completed successfully!" 