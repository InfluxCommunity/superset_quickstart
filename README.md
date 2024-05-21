# superset_quickstart
Quickly connect InfluxDB Cloud 3.0 to Superset. This project includes all of the Superset initialization and InfluxDB connection as a part of the dockerc configuration. 

## Get Started
1. Sign up for a free [InfluxDB Cloud 3.0 trial](https://cloud2.influxdata.com/signup).
2. Gather your authentication credentials including:
- database
- token
- URL
3. Edit the app/add_influxdb_connection.sh to include those credentials.
4. cd into Superset
5. Run `docker-compose up --build -d`
6. Visit http://127.0.0.1:8088 to use Apache Superset.
7. Login with "admin" for the username and password. 
8. Start building visualizations and dashboards for your timeseries data! 
