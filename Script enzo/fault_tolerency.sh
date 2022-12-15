#!/bin/sh

# every minute ping $RANDOM_NODE_1 and $RANDOM_NODE_2
# if it's done connect to an other node in adresses.txt
multichain-cli poc getpeerinfo | jq '.[].addr' | sed 's/"//g; s/:.*//' > connected_node.txt
# executre get_other_node_ip.sh to get the ip addresses of the other nodes
./get_other_node_ip.sh

while sleep 5m
do
  ping -c 1 $RANDOM_NODE_1
    if [ $? -eq 0 ]
    then
        echo "ping $RANDOM_NODE_1 success"
    else
        echo "ping $RANDOM_NODE_1 failed"
        # connect to an other node in addresses.txt that is not in connected_node.txt
        while read line
        do
            if grep -Fxq "$line" connected_node.txt
            then
                echo "node $line already connected"
            else
                echo "node $line not connected"
                multichain-cli wikichain@$line:$port -daemon
                break
            fi
        done < ip_addresses.txt

    fi
  ping -c 1 $RANDOM_NODE_2
    if [ $? -eq 0 ]
    then
        echo "ping $RANDOM_NODE_2 success"
    else
        echo "ping $RANDOM_NODE_2 failed"
        # connect to an other node in addresses.txt that is not in connected_node.txt
        while read line
        do
            if grep -Fxq "$line" connected_node.txt
            then
                echo "node $line already connected"
            else
                echo "node $line not connected"
                multichain-cli wikichain@$line:$port -daemon
                break
            fi
        done < ip_addresses.txt

    fi

    
  
