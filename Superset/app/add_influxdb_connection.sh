#!/bin/bash

# Set variables
DOMAIN="us-east-1-1.aws.cloud2.influxdata.com"
PORT="443"
DATABASE="cpu"
TOKEN="xxx"
DISPLAY_NAME="InfluxDB Cloud Serverless"

# Construct SQLAlchemy URI
SQLALCHEMY_URI="datafusion+flightsql://${DOMAIN}:${PORT}?database=${DATABASE}&token=${TOKEN}"

# Add the database connection
superset set_database_uri -d "${DISPLAY_NAME}" -u "${SQLALCHEMY_URI}"
