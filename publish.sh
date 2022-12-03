#/bin/bash

# This script is used to publish in the wikichain stream a new article
# The article is a json file that contains the title, the content and the author of the article and theme
# The article is published in the wikichain stream

# the user will do in the terminal : ./publish.sh article.json
# the article.json file will be the first argument of the script

# get the article.json file
article=$1

# get the title of the article
title=$(cat $article | jq '.title')

# get the content of the article
content=$(cat $article | jq '.content')

# get the author of the article
author=$(cat $article | jq '.author')

# get the theme of the article
theme=$(cat $article | jq '.theme')

# publish the article in the wikichain stream 
multichain-cli wikichain publish wikichain "{\"json\":{\"title\":$title,\"content\":$content,\"author\":$author,\"theme\":$theme}}"





