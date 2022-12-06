#!/bin/sh

# Replace the path to the adresses.txt file below
ADDRESSES_FILE="addresses.txt"

"""
Starting Nmap 7.80 ( https://nmap.org ) at 2022-12-06 06:18 CET
Nmap scan report for 192.168.40.170
Host is up (0.00096s latency).
Not shown: 65533 closed ports
PORT     STATE SERVICE
22/tcp   open  ssh
5775/tcp open  unknown
"""
port=$(nmap -p- $(head -n 1 addresses.txt) | awk '/\// {print $1}' | sed -n 3p | awk -F/ '{print $1}')


# Read the IP addresses from the adresses.txt file and store them in an array
IP_ADDRESSES=($(cat "$ADDRESSES_FILE"))
# IP addresses containt all Ip on network including the host ip
# Remove the host ip from the array
IP_ADDRESSES=("${IP_ADDRESSES[@]/$IP_ADDR}")

# If the array is empty, exit the script
if [ ${#IP_ADDRESSES[@]} -eq 0 ]; then
    echo "No other nodes found"
    exit 0
fi

# If the array is not empty, connect to the first node in the array
# and send the wallet address to the master node
if [ ${#IP_ADDRESSES[@]} -gt 0 ]; then
    echo "Connecting to ${IP_ADDRESSES[0]}:$port"
    multichaind wikichain@$IP_ADDRESSES:$port -daemon
fi

# iterate 