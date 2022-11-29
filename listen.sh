#/bin/bash
# This script is used to listen to a port , the port will receive a message an address from other node,
# and add adress in the list of known nodes in /home/node1/addresses.txt

# The port number is 5000
PORT=5000

# The file that contains the list of known nodes
FILE=/home/node1/addresses.txt

# The script will listen to the port and wait for a message
while true; do
    # The message will be stored in the variable MESSAGE
    MESSAGE=$(nc -l -p $PORT)
    # The message will be added to the list of known nodes
    echo $MESSAGE >> $FILE
done



