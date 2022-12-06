cd /tmp
wget https://www.multichain.com/download/multichain-2.3.1.tar.gz
tar -xvzf multichain-2.3.1.tar.gz
cd multichain-2.3.1
mv multichaind multichain-cli multichain-util /usr/local/bin
multichain-util create wikichain
# edit "/home/node1/.multichain/wikichain/params.dat" and put every false to true with sed
sed -i 's/false/true/g' /home/node1/.multichain/wikichain/params.dat
apt-get install nmap
apt-get install ipcalc
multichaind wikichain -daemon
multichain-cli wikichain create stream wikichain true
#edit cron file to execute "get_other_node_ip.sh" every  minute
echo "* * * * * /home/node1/get_other_node_ip.sh" >> /etc/crontab
ip_addr=$(ip addr show | grep ens33 | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | awk '{print $2}')
export IP_ADDR=$ip_addr
nohup python3 ./get_wallet.py &
mkdir articles
# edit cron file to execute "get_publish_article.sh" every  minute
echo "* * * * * /home/node1/get_publish_article.sh" >> /etc/crontab
# activate cron 
service cron start









