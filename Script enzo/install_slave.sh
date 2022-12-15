cd /tmp
wget https://www.multichain.com/download/multichain-2.3.1.tar.gz
tar -xvzf multichain-2.3.1.tar.gz
cd multichain-2.3.1
mv multichaind multichain-cli multichain-util /usr/local/bin
echo "* * * * * /home/node1/get_other_node_ip.sh" >> /etc/crontab
# edit "/home/node1/.multichain/wikichain/params.dat" and put every false to true with sed
apt-get install nmap
apt-get install ipcalc
apt-get install jq
ip_addr=$(ip addr show | grep ens33 | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | awk '{print $2}')
export IP_ADDR=$ip_addr
./get_other_node_ip.sh
./connect.sh
./send_ip_maste_wallet.sh
./fault_tolerency.sh &







