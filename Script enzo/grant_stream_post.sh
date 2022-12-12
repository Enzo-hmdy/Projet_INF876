#/bin/bash
# send to all node in addresses.txt the grant stream : multichain-cli wikichain send adress 0
# replace adress by the adress of the node that will send the grant stream
# USLESS REPLACED BY get_wallet.py

# get the list of known nodes
addresses=$(cat /home/node1/addresses.txt)

# for each node in the list of known nodes
for address in $addresses
do
    # send grant stream to the node
    multichain-cli wikichain send $address 0
done

# then delete the list of known nodes without deleting the file
> /home/node1/addresses.txt

