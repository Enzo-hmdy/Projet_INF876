#/bin/sh!
ip_addr=$(ip addr show | grep ens33 | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | awk '{print $2}')
export IP_ADDR=$ip_addr
net_addr=$(ipcalc -n $ip_addr | awk '/Network:/ {print $2}')

# Scan the network for other hosts
nmap -sn $net_addr

# Print the IP addresses of the hosts that were found, excluding .2 and .254
# Save the output to the file "addresses.txt"
nmap -sn $net_addr | grep -Eo '([0-9]{1,3}\.){3}[0-9]{1,3}' | grep -Ev '(.2|.254)$' | tee addresses.txt