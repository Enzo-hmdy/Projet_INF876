

import os
from collections import Counter
import math
import json
import sys

query = sys.argv[1]



def get_tf(word,document):
    words = document.split()
    return Counter(words)[word] / len(words)

def get_idf(word,documents):
    count = 0
    for document in documents:
        if word in document:
            count += 1
    return math.log(len(documents) / count)

def get_tf_idf(word,document,documents):
    return get_tf(word,document) * get_idf(word,documents)


articles_files = [f for f in os.listdir('articles') if os.path.isfile(os.path.join('articles', f))]
articles = []

for article in articles_files:
    with open(os.path.join('articles', article)) as f:
        data = json.load(f)
        articles.append(data['content'])

tf_idf_score = {}


for i,document in enumerate(articles):
    tf_idf_score[i] = sum([get_tf_idf(word,document,articles) for word in query.split()])

# copy best article in a new file 
with open('best_article.txt', 'w') as f:
    f.write(articles[max(tf_idf_score, key=tf_idf_score.get)])
    







