#Build Steps
FROM node:alpine3.10 AS build
RUN mkdir /app
WORKDIR /app
COPY package.json /app
RUN npm i
COPY . /app
RUN npm run build

#Run Steps
FROM nginx:1.19.8-alpine
COPY --from=build /app/build /user/share/nginx/html