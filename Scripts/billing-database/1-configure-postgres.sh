#!/bin/bash
set -e

PGPASSWORD=$(cat /run/secrets/pgpassword)

# Ensure the script is executable
chmod +x /docker-entrypoint-initdb.d/1-configure-postgres.sh

# Create the SQL file with the password change command
echo "ALTER USER postgres WITH PASSWORD '$PGPASSWORD';" > /docker-entrypoint-initdb.d/change_password.sql

# Run the SQL file as the postgres user
psql -U postgres -f /docker-entrypoint-initdb.d/change_password.sql

# Clean up by removing the SQL file
rm /docker-entrypoint-initdb.d/change_password.sql
