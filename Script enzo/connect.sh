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
export port


# Read the IP addresses from the adresses.txt file and store them in an array
IP_ADDRESSES=($(cat "$ADDRESSES_FILE"))
# IP addresses containt all Ip on network including the host ip
# Remove the host ip from the array
IP_ADDRESSES=("${IP_ADDRESSES[@]/$ip_addr}")

# If the array is empty, exit the script
if [ ${#IP_ADDRESSES[@]} -eq 0 ]; then
    echo "No other nodes found"
    exit 0
fi

# If the array is just 1 element, connect to that node
if [ ${#IP_ADDRESSES[@]} -eq 1 ]; then
    echo "Connecting to ${IP_ADDRESSES[0]}"
    multichaind wikichain@$IP_ADDRESSES:$port -daemon
fi


# If the array has more has 2 elements, or more , randomly select two of the nodes
# and connect to them

if [ ${#IP_ADDRESSES[@]} -gt 1 ]; then
    # Randomly select two nodes
    export RANDOM_NODE_1=${IP_ADDRESSES[$RANDOM % ${#IP_ADDRESSES[@]} ]}
    export RANDOM_NODE_2=${IP_ADDRESSES[$RANDOM % ${#IP_ADDRESSES[@]} ]}

    # If the two nodes are the same, select another one
    while [ "$RANDOM_NODE_1" == "$RANDOM_NODE_2" ]; do
        RANDOM_NODE_2=${IP_ADDRESSES[$RANDOM % ${#IP_ADDRESSES[@]} ]}
    done

    echo "Connecting to $RANDOM_NODE_1 and $RANDOM_NODE_2"
    multichaind wikichain@$RANDOM_NODE_1:$port@$RANDOM_NODE_2:$port -daemon
fi



# iterate 