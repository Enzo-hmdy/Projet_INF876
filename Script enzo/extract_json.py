"""
[
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
                "Title" : "Jane Smith",
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
                "Title" : "test2",
                "city" : "pouet"
            }
        },
        "confirmations" : 11,
        "blocktime" : 1669682011,
        "txid" : "d68132775ba2bd74374d697c1e0f4e1da4fca91c80a5035e5e6b90dad33156ff"
    }
]
"""

# from these previous json, we want to extract the data field for each json (they are located in the same file)

import json

with open('articles.json') as f:
    data = json.load(f)

for p in data:
    print(p['data']['json'])
    # write output in different file .json with the name of title in folder articles (in linux system)
    with open('articles/' + p['data']['json']['title'] + '.json', 'w') as outfile:
        json.dump(p['data']['json'], outfile)
        
        


    










# output
# {'name': 'Jane Smith', 'city': 'Paris'}
# {'name': 'test2', 'city': 'pouet'}

