# Kubernetes Network Troubleshooting 

## Deploy Test Pods
### BusyBox
```bash
kubectl run busybox \
  --image=busybox \
  --restart=Never \
  -n default \
  --command -- sleep 3600
```

### Netshoot
```bash
kubectl run netshoot \
  --image=nicolaka/netshoot \
  --restart=Never \
  -it -- bash
```

## Connect to Pods
```bash
kubectl exec -it busybox -n default -- sh
```
```bash
kubectl exec -it POD_NAME -c CONTAINER_NAME -- sh
```

## Kubernetes Debug Commands
```bash
kubectl describe pod POD_NAME -n NAMESPACE
```
```bash
kubectl logs POD_NAME -c CONTAINER_NAME
```

## Basic Network Tools (BusyBox)
### Ping
```bash
ping google.com
```
### HTTP Test
```bash
wget -O- http://example.com
```
### DNS Lookup
```bash
nslookup kubernetes.default
```
### TCP Test
```bash
telnet my-service 80
```
### Port Scan
```bash
nc -zv my-service 80
```
### View Interfaces
```bash
ifconfig
```
### Routing Table
```bash
route -n
```

## Advanced Tools (Netshoot)
### MTR
```bash
mtr google.com
```
### Traceroute
```bash
traceroute google.com
```
### Curl
```bash
curl -v google.com
```
### Dig
```bash
dig google.com
```
```bash
dig @8.8.8.8 google.com
```
### tcpdump
```bash
tcpdump -i any -w /tmp/capture.pcap
```
### Copy Capture
```bash
kubectl cp default/netshoot:/tmp/capture.pcap ./capture.pcap
```
