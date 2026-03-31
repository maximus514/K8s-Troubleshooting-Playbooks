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

## Kubernetes log and description Commands
view deployment info
```bash
kubectl describe pod POD_NAME -n NAMESPACE
```
view application logs
```bash
kubectl logs POD_NAME -c CONTAINER_NAME
```

## Basic Network Tools (BusyBox)
### Ping
test connectivity with ICMP packet
```bash
ping google.com
```
### HTTP Test
Test the enpoint response
```bash
wget -O- http://example.com
```
### DNS Lookup
Test DNS resolution
```bash
nslookup kubernetes.default
```
### TCP Test
Test TCP connection/handshake
```bash
telnet my-service 80
```
### Port Scan
Scan open ports on endpoint
```bash
nc -zv my-service 80
```
### View Interfaces
review the pods assigned IP 
```bash
ifconfig
```
### Routing Table
Review the pods default gateways
```bash
route -n
```

## Advanced Tools (Netshoot)
### MTR
review the route to the endpoint with perfomance (traceroute + ping)

```bash
mtr google.com
```
### Traceroute
view route to endpoint
```bash
traceroute google.com
```
### Curl
test endpont with HTTP call
```bash
curl -v google.com
```
### Dig
test DNS resolution 
```bash
dig google.com
```
force DNS resolution server
```bash
dig @8.8.8.8 google.com
```
### tcpdump
run packet capture on pod
```bash
tcpdump -i any -w /tmp/capture.pcap
```
### Copy Capture
retrieve packet capture from pod 
```bash
kubectl cp default/netshoot:/tmp/capture.pcap ./capture.pcap
```
Once the pcap file is retireved, upload it to the wireshark application to view the contents.  

Download wireshark here : 

https://www.wireshark.org/
