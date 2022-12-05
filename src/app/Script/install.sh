#cd /tmp
apt-get install ipcalc -y
wget https://www.multichain.com/download/multichain-2.3.1.tar.gz
tar -xvzf multichain-2.3.1.tar.gz
cd multichain-2.3.1
mv multichaind multichain-cli multichain-util /usr/local/bin
multichain-util create wikichain
# edit "/home/node1/.multichain/wikichain/params.dat" and put every false to true with sed
sed -i 's/false/true/g' /home/node1/.multichain/wikichain/params.dat
multichaind wikichain -daemon
multichain-cli wikichain create stream wikichain true
#edit cron file to execute "grant_stream_post.sh" every  minute
echo "* * * * * /home/node1/grant_stream_post.sh" >> /etc/crontab
#edit cron file to execute "get_other_node_ip.sh" every  minute
echo "* * * * * /home/node1/get_other_node_ip.sh" >> /etc/crontab







