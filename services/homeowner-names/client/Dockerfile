FROM node:22.1.0-alpine3.18

WORKDIR /opt/app/client

COPY package.json yarn.lock ./

RUN yarn install

COPY . ./

EXPOSE 3000

CMD ["yarn", "dev"]
