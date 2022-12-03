"""
{
        "publishers" : [
            "1YraMY26qXdPGraKcfMXkMGguc1dTcaUevf3Kc"
        ],
        "keys" : [
            "key2"
        ],
        "offchain" : false,
        "available" : true,
        "data" : {
            "json" : {
                "name" : "Jane Smith",
                "city" : "Paris"
            }
        },
        "confirmations" : 11,
        "blocktime" : 1669682011,
        "txid" : "d68132775ba2bd74374d697c1e0f4e1da4fca91c80a5035e5e6b90dad33156ff"
    }
    {
        "publishers" : [
            "1YraMY26qXdPGraKcfMXkMGguc1dTcaUevf3Kc"
        ],
        "keys" : [
            "key2"
        ],
        "offchain" : false,
        "available" : true,
        "data" : {
            "json" : {
                "name" : "test2",
                "city" : "pouet"
            }
        },
        "confirmations" : 11,
        "blocktime" : 1669682011,
        "txid" : "d68132775ba2bd74374d697c1e0f4e1da4fca91c80a5035e5e6b90dad33156ff"
    }
"""

# from these previous json, we want to extract the data field for each json (they are located in the same file)

import json

with open('data.json') as f:
    data = json.load(f)

for p in data:
    print(p['data']['json'])

# output
# {'name': 'Jane Smith', 'city': 'Paris'}
# {'name': 'test2', 'city': 'pouet'}

