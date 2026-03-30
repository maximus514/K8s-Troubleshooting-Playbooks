# Deploy a test pod : 

kubectl run busybox \
  --image=busybox \
  --restart=Never \
  -n default \
  --command -- sleep 3600

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

