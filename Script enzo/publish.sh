#/bin/bash

# This script is used to publish in the wikichain stream a new article
# The article is a json file that contains the title, the content and the author of the article and theme
# The article is published in the wikichain stream

# the user will do in the terminal : ./publish.sh article.json
# the article.json file will be the first argument of the script

# title is argv[1]
title=$1
# content is argv[2]
content=$2
# author is argv[3]
author=$3
# theme is argv[4]
theme=$4


# publish the article in the wikichain stream 
multichain-cli wikichain publish wikichain wikikey"{\"json\":{\"title\":$title,\"content\":$content,\"author\":$author,\"theme\":$theme}}"





