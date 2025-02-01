# https://oastic.com/posts/how-to-monitor-an-ubuntu-server-with-grafana-and-prometheus/
# Installed and it starts up every time I guess?
# Prometheus Node Exporter used for metric collection https://github.com/prometheus/node_exporter
# Need to update the OS collector mount points for Node exporter to catch it?
# --collector.filesystem.mount-points-exclude=^/(dev|proc|sys|var/lib/docker/.+|var/lib/kubelet/.+)($|/)
# Remove "dev"
# --collector.filesystem.mount-points-exclude=^/(proc|sys|var/lib/docker/.+|var/lib/kubelet/.+)($|/)
# https://github.com/prometheus/node_exporter/blob/master/collector/diskstats_linux.go
# https://github.com/prometheus/node_exporter/issues/332