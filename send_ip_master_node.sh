#/bin/bash

# send ip to all nodes (their are located in same network)
# the port is 5000

# get ip of master node on a mimimalist debian 11 (use ip a)
my_ip =$(ip a | grep "inet 192.168." | awk '{print $2}' | cut -d "/" -f 1)
# send ip to all nodes
echo $ip | nc -w 1


