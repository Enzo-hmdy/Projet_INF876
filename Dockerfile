FROM httpd:2.4

COPY ./public-html /usr/local/apache2/htdocs/

FROM python:3

WORKDIR /usr/src/app
COPY /Script /usr/src/app

# docker build -t wikichain .


# docker run -dit -p 8080:80 --name WikiChain wikichain