# Path: script.sh
#/bin/bash

# create a enmpty file myaddress{}.txt and replace {} with the random number and keep the file name in a variable
filename=myaddress$(shuf -i 1-999999 -n 1).txt
touch $filename


multichain-cli wikichain getaddresses > $filename
# only keep adress and remove []
sed -i 's/[][]//g' $filename
# only keep adress and remove ""
sed -i 's/""//g' $filename
# only keep adress and space
sed -i 's/ //g' $filename
# remove backline
sed -i 's/ //g' $filename

#send content of file to port 5000 to master node
cat $filename | nc -w 1


