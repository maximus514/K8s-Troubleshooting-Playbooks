## NMAP & Nping cheat sheet

## Ping only scan ##
nmap -sP 192.168.1.2
 
## Scan and do traceroute ##
nmap --traceroute IP-ADDRESS
nmap --traceroute DOMAIN-NAME-HERE
 
## TCP SYN Scan ##
nmap -sS 192.168.1.2
 
## UDP Scan ##
nmap -sU 192.168.1.2
 
## IP protocol scan ##
nmap -sO 192.168.1.2
 
## Scan port 80, 25, 443 ##
nmap -p 80 192.168.1.2
nmap -p http 192.168.1.2
nmap -p 25 192.168.1.2
nmap -p smtp 192.168.1.2
nmap -p 443 192.168.1.2
nmap -p 80,24,443 192.168.1.2
 
## Scan port ranges ##
nmap -p 512-1024 192.168.1.2
 
## Scan for OS i.e. Operating System Detection ##
nmap -O 192.168.1.2
nmap -O --osscan-guess 192.168.1.2
 
## Scan for application server version ##
nmap -sV 192.168.1.2

Nping command 
nping --tcp-connect -p 10443 -c 5 10.199.46.57
