#Build Steps
FROM node:alpine AS build
RUN mkdir /app
WORKDIR /app
COPY package.json /app
RUN npm i
COPY . /app
RUN npm run build

#Run Steps
FROM nginx:alpine
COPY --from=build /app/build /user/share/nginx/html