#cd /tmp
apt-get install ipcalc -y
wget https://www.multichain.com/download/multichain-2.3.1.tar.gz
tar -xvzf multichain-2.3.1.tar.gz
cd multichain-2.3.1
mv multichaind multichain-cli multichain-util /usr/local/bin
cd ..
multichain-util create wikichain
# edit "/home/node1/.multichain/wikichain/params.dat" and put every false to true with sed
sed -i 's/false/true/g' /home/node1/.multichain/wikichain/params.dat
apt-get install nmap -y
apt-get install ipcalc -y
multichaind wikichain -daemon
multichain-cli wikichain create stream wikichain true
multichain-cli wikichain subscribe wikichain
#edit cron file to execute "get_other_node_ip.sh" every  minute
# get path of script get get_other_node_ip.sh
path=$(pwd)
echo "* * * * * $path/get_other_node_ip.sh" >> /etc/crontab
ip_addr=$(ip addr show | grep ens33 | grep -Eo 'inet (addr:)?([0-9]*\.){3}[0-9]*' | awk '{print $2}')
export IP_ADDR=$ip_addr
nohup python3 ./get_wallet.py &
mkdir articles
# edit cron file to execute "get_publish_article.sh" every  minute
echo "* * * * * $path/get_publish_article.sh" >> /etc/crontab
# activate cron 
service cron start
apt-get install jq -y









