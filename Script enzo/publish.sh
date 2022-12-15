# Set the variables for the article
AUTHOR="John Doe"
TITLE="My First Article"
THEME="Technology"
CONTENT="This is the content of my first article"

# Create the JSON string for the article
JSON_STRING="{\"json\":{\"author\":\"${AUTHOR}\",\"title\":\"${TITLE}\",\"theme\":\"${THEME}\",\"content\":\"${CONTENT}\"}}"

# Publish the article to the "articles" stream in Multichain
multichain-cli wikichain publish wikichain "key1" $JSON_STRING 