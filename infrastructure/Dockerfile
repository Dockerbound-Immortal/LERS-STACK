FROM nginx:1.23.3-alpine

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

COPY ./nginx/nginx.conf /etc/nginx/conf.d/default.conf

CMD ["dockerize", "-wait", "tcp://street-group-api:9000", "-timeout", "60s", "nginx", "-g", "daemon off;"]
