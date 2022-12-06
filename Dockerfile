### STAGE 1: Build ###
FROM node as node
WORKDIR /usr/src/app
COPY package.json package-lock.json ./
RUN npm install
COPY . .
### STAGE 2: Run ###
FROM nginx:1.17.1-alpine
COPY nginx.conf /etc/nginx/nginx.conf
COPY --from=node /usr/src/app/* /usr/share/nginx/html


#FROM nginx
#COPY nginx.conf /etc/nginx/nginx.conf
#WORKDIR /usr/src/app
#COPY /src/app/Script /usr/src/app/Script
#COPY /src/app/www /usr/src/www
#
#RUN apt update -y
#RUN apt install python3 -y
#
#WORKDIR /usr/src/app
#COPY /src/app/Script /usr/src/app
#RUN /usr/src/app/install.sh





# docker build -t wikichain .
# docker run -dit -p 8080:80 --name WikiChain wikichain