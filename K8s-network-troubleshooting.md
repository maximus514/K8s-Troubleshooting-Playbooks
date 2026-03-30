# Deploy a test pod : 

```bash
kubectl run busybox \
  --image=busybox \
  --restart=Never \
  -n default \
  --command -- sleep 3600
```
# If --command is not specified, BusyBox starts and immediately exits

# Remote to the pod : 

kubectl exec -it busybox -n defult -- sh
OR 
kubectl exec -it POD_NAME -c CONTAINER_NAME -- sh  ## connect to specific container in the pod 

# Once connected to the pod/container - the "sh" shell comes with the following commands 

## COMMANDS FOR TROUBLESHOOTING NETWORK ISSUES ## 

# ping - ICMP test 

ping google.com

# wget - testing services/endpoints

wget -O- http://example.com

# nslookup - DNS resolution testing

nslookup kubernetes.default

# telnet - Test TCP connectivity to a port

telnet my-service 80

# NetCat - Port scanner

nc -zv my-service 80

# ifconfig - View network interfaces

ifconfig

# route - Show routing table

route -n

# Describe Pod 

kubectl describe pod POD_NAME -n NAMESPACE

# VIEW LOGS 

kubectl logs POD_NAME -c CONTAINER_NAME

# For an Image with better networking tools, use "nicolaka/netshoot" : 

kubectl run netshoot \
  --image=nicolaka/netshoot \
  --restart=Never \
  -it -- bash

## ADVANCE COMMANDS THAT COME WITH netshoot ##

# MTR - network diagnostic tool that combines traceroute and ping functionality into one interactive, real-time command-line interface

mtr google.com

# Traceroute - view route to destination 

traceroute google.com

# Curl - View HTTP response 

curl -v google.com

# Dig - DNS resolution 

dig google.com # uses resolv.conf dns server

dig @8.8.8.8 google.com # force to resovle from specific dns server 

# TCP Dump - view network traffic 

tcpdump -i any -w /tmp/capture.pcap

# Exit the container, then run:

kubectl cp default/netshoot:/tmp/capture.pcap ./capture.pcap
