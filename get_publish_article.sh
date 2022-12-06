#/bin/bash
# this script is used to get all the articles published in the wikichain stream
# the articles are stored in the file articles.txt

multichain-cli wikichain liststreamitems wikichain > articles.json
python3 extract_json.py



