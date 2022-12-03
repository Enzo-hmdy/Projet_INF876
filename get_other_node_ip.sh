# Get the IP address of the network interface
ip_addr=$(ip addr show | grep ens33 | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | awk '{print $2}')
echo "IP address: $ip_addr"

# Get the network mask of the network interface
mask_addr=$(ifconfig | grep -E 'netmask ' | awk '{print $4}')
echo "Network mask: $mask_addr"


# Compute the network address of the interface
net_addr=$(ipcalc -n $ip_addr $mask_addr | awk '/Network:/ {print $2}')
echo "Network address: $net_addr"

# Compute the broadcast address of the interface
broadcast_addr=$(ipcalc -b $ip_addr $mask_addr | awk '/Broadcast:/ {print $2}')
echo "Broadcast address: $broadcast_addr"

# Compute the range of IP addresses on the network
start_addr=$(ipcalc -s $ip_addr $mask_addr | awk '/HostMin:/ {print $2}')
end_addr=$(ipcalc -e $ip_addr $mask_addr | awk '/HostMax:/ {print $2}')

# Scan the network for other IP addresses
for ip in $(seq $start_addr $end_addr); do
    # Check if the IP address is reachable
    if ping -c 1 $ip > /dev/null; then
        # Add the IP address to the file
        echo $ip >> other_node.txt
    fi
done
