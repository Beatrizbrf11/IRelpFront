FROM node:latest as angular
WORKDIR /app
COPY package.json /app
RUN npm install --silent
COPY . .
COPY proxy.conf.json /app
RUN npm run build

FROM nginx:alpine
VOLUME /var/cache/nginx
COPY --from=angular app/dist/irelpfront/ /usr/share/nginx/html