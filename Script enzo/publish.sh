                                           # Set the variables for the article
AUTHOR=$1
TITLE=$2
THEME=$3
CONTENT=$4

# Create the JSON string for the article
JSON_STRING="{\"json\":{\"author\":\"${AUTHOR}\",\"title\":\"${TITLE}\",\"theme\":\"${THEME}\",\"content\":\"${CONTENT}\"}}"

# Publish the article to the "articles" stream in Multichain
multichain-cli wikichain publish wikichain "key1" $JSON_STRING 
