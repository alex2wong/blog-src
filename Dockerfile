# Using a compact OS
FROM alpine:latest

MAINTAINER Pan Jiabang <panjiabang@gmail.com> 

# Install Nginx
RUN apk --update add nginx
RUN apk --update add nodejs
RUN apk --update add python
RUN apk --update add make

# Add 2048 stuff into Nginx server

RUN npm install hexo -g

COPY ./ /tmp
WORKDIR /tmp/blog.jamespan.me/

RUN npm install
RUN hexo clean
RUN hexo generate

COPY ./public /usr/share/nginx/html

EXPOSE 80

# Start Nginx and keep it from running background
CMD ["nginx", "-g", "daemon off;"]