#/bin/sh

# send wallet to master node with telnet on port 1234

# get the ip address of the master node (the ip address is the first line of the file ip.txt)


# get the wallet of the node
multichain-cli wikichain getaddresses > myaddress.txt
# only keep adress and remove []
sed -i 's/[][]//g' myaddress.txt
# only keep adress and remove "
sed -i 's/"//g' myaddress.txt
# only keep adress and space
sed -i 's/ //g' myaddress.txt
# remove backline
sed -i 's/ //g' myaddress.txt
sed -E ':a;N;$!ba;s/[[:space:]]*\n[[:space:]]*/ /g' myaddress.txt > myaddress2.txt
rm myaddress.txt

# send the wallet to the master node
cat myaddress2.txt | telnet $ip 1234






