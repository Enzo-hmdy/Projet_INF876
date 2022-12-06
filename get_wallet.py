import os
import socket
import signal
import subprocess

# get the value of the $IP_ADDR environment variable
ip_addr = os.environ['IP_ADDR']

# create a socket and bind it to the IP address specified by $IP_ADDR:1234
s = socket.socket()
s.bind((ip_addr, 1234))
f = open("wallet.txt", "w")

# listen for incoming connections
s.listen()

def shutdown():
    # close the file
    f.close()
    
    # close the socket
    s.close()
    
    # exit the script
    exit()

while True:
    signal.signal(signal.SIGINT, lambda signum, frame: shutdown())
    # accept incoming connections
    client, addr = s.accept()
    
    # receive data from the client
    data = client.recv(1024)

    # write the data to the file wallet.txt
    result = subprocess.run(['multichain-cli', 'wikichain', 'send', data, '0'], stdout=subprocess.PIPE)

    
    # echo the data back to the client
    client.send(result)
    
    # close the connection
    client.close()
    f.flush()

f.close()   