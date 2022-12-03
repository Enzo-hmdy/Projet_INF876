#/bin/bash

# send ip to all nodes (their are located in same network)
# the port is 5000

# get ip of master node on a mimimalist debian 11 (use ip a)
my_ip =$(ip a | grep "inet 192.168." | awk '{print $2}' | cut -d "/" -f 1)

# find all nodes in the network 192.168.0.0/16
for ip in $(seq 1 254); do
    # print to see the progress
    echo $ip
    for ip2 in $(seq 1 254); do
        # check if ping is ok
        ping -c 1 192.168.$ip.$ip2 > /dev/null
        # if ping is ok send ip to port 5000
        echo $ip2
        if [ $? -eq 0 ]; then
            echo $my_ip 
        fi

        echo $my_ip | nc -w 1 192.168.0.$ip 5000
    
    done
    
done




