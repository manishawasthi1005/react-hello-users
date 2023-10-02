#Build Steps
FROM node:alpine AS build
RUN mkdir /app
RUN chgrp -R 0 /var/cache/nginx/client_temp && \
    chmod -R g+rwX /var/cache/nginx/client_temp
WORKDIR /app
COPY package.json /app
RUN npm i
COPY . /app
RUN npm run build

#Run Steps
FROM nginx:alpine
COPY --from=build /app/build /user/share/nginx/html

/var/cache/nginx/client_temp