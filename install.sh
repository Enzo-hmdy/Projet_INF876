cd /tmp
wget https://www.multichain.com/download/multichain-2.3.1.tar.gz
tar -xvzf multichain-2.3.1.tar.gz
cd multichain-2.3.1
mv multichaind multichain-cli multichain-util /usr/local/bin
multichain-util create wikichain
# edit "/home/node1/.multichain/wikichain/params.dat" and put every false to true with sed
sed -i 's/false/true/g' /home/node1/.multichain/wikichain/params.dat





