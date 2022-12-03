# Get the IP address of the network interface
ip_addr=$(ip addr show | grep ens33 | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | awk '{print $2}')
echo "IP address: $ip_addr"

# Get the network mask of the network interface
mask_addr=$(ifconfig | grep ens33 -A 1 | grep -E 'netmask ' | awk '{print $4}')
echo "Network mask: $mask_addr"


# Compute the network address of the interface
net_addr=$(ipcalc -n $ip_addr $mask_addr | awk '/Network:/ {print $2}')
echo "Network address: $net_addr"

# Compute the broadcast address of the interface
broadcast_addr=$(ipcalc -b $ip_addr $mask_addr | awk '/Broadcast:/ {print $2}')
echo "Broadcast address: $broadcast_addr"

# Compute the range of IP addresses on the network
range_addr=$(ipcalc -n $ip_addr $mask_addr | awk '/HostMin:/ {print $2}')"-"$(ipcalc -n $ip_addr $mask_addr | awk '/HostMax:/ {print $2}')
echo "Range of IP addresses: $range_addr"


# Scan the network for other IP addresses with ping

# Get the first IP address of the range
first_addr=$(echo $range_addr | cut -d "-" -f 1)

# Get the last IP address of the range
last_addr=$(echo $range_addr | cut -d "-" -f 2)

# Get the first three octets of the IP address

# The fourth octet will be incremented in the loop
first_three_octets=$(echo $first_addr | cut -d "." -f 1-3)

# Loop through the range of IP addresses
for i in $(seq $(echo $first_addr | cut -d "." -f 4) $(echo $last_addr | cut -d "." -f 4)); do
    # Compute the IP address
    ip=$first_three_octets.$i

    # Ping the IP address
    ping -c 1 $ip > /dev/null

    # If ping is successful, print the IP address
    if [ $? -eq 0 ]; then
        echo "Found IP address: $ip"
    fi
done



