FROM apache/superset

USER root

# Copy your scripts and configuration directly to /app
COPY app/add_influxdb_connection.sh /app/add_influxdb_connection.sh
COPY app/superset_config.py /app/superset_config.py

# Ensure the script is executable and install the right library 
RUN chmod +x /app/add_influxdb_connection.sh
RUN pip install flightsql-dbapi

# Set PYTHONPATH to include /app if not already included
ENV PYTHONPATH "${PYTHONPATH}:/app"

USER superset

# Adding && echo "Admin created" for debugging
# ENTRYPOINT ["/bin/bash"]

ENTRYPOINT ["/bin/sh", "-c", "\
    echo 'Starting database upgrade...' && \
    superset db upgrade && \
    echo 'Database upgraded.' && \
    echo 'Initializing Superset...' && \
    superset init && \
    echo 'Superset initialized.' && \
    echo 'Creating admin user...' && \
    superset fab create-admin \
        --firstname Admin \
        --lastname User \
        --email admin@example.com \
        --username admin \
        --password admin && echo 'Admin created' || echo 'Admin creation failed' && \
    echo 'Adding InfluxDB connection...' && \
    /app/add_influxdb_connection.sh && \
    echo 'InfluxDB connection added.' && \
    echo 'Starting Superset...' && \
    superset run -p 8088 \
        --with-threads \
        --reload \
        --debugger \
        --host=0.0.0.0"]

