# https://oastic.com/posts/how-to-monitor-an-ubuntu-server-with-grafana-and-prometheus/

# sudo vim /etc/grafana/grafana.ini
# Port to 443? May need nginx in front of default 3000 for reverse proxy to host under DNS name.
# Set up SMTP support to send emails for alerting
# Set up dashboard and alarms