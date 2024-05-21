#!/bin/sh

# Generate a secure SECRET_KEY
SECRET_KEY=$(openssl rand -base64 42)
export SECRET_KEY

# Log the generated SECRET_KEY for debugging purposes
echo "Generated and set SECRET_KEY: $SECRET_KEY"

# Ensure the SECRET_KEY is set in superset_config.py
echo "SECRET_KEY = '$SECRET_KEY'" >> /app/pythonpath_dev/superset_config.py

# Run the initialization and start Superset
superset db upgrade
superset init
superset fab create-admin --username admin --firstname Superset --lastname Admin --email admin@superset.com --password admin || true
superset run -p 8088 --with-threads --reload --debugger
